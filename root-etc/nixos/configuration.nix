# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;
  boot.supportedFilesystems = [ "ntfs" ];
  # boot.plymouth.enable = true;

  # GPU Drivers
  hardware.opengl = {
    ## radv: an open-source Vulkan driver from freedesktop
    driSupport = true;
    driSupport32Bit = true;

    ## amdvlk: an open-source Vulkan driver from AMD
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };

  # Zram Swap
  zramSwap.enable = true;

  networking.hostName = "erfan-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment and SDDM.
  services.displayManager.sddm = {
    enable = true;
    settings = {
      Autologin = {
        Session = "hyprland.desktop";
        User = "erfan";
      };
    };
  };
  services.desktopManager.plasma6.enable = true;
  # Workaround for SDDM crash
  systemd.services.display-manager.wants = [ "systemd-user-sessions.service" "multi-user.target" "network-online.target" ];
  systemd.services.display-manager.after = [ "systemd-user-sessions.service" "multi-user.target" "network-online.target" ];

  # Set up Hyprland
  programs.hyprland = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Hint to use wayland
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # Security agents
  security.pam.services.sddm.kwallet.enable = true;
  security.polkit.enable = true;

  # Gaming
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  hardware.bluetooth.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.erfan = {
    isNormalUser = true;
    description = "Amirerfan Rafati";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "erfan";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Main
    brave
    telegram-desktop
    thunderbird

    # Tools
    gparted

    # Cli
    fish
    starship
    htop
    socat # Needed for Hyprland scripts
    wget # mason.nvim likes to have it :/
    fzf
    ripgrep # telescope.nvim wants it
    fd # telescope.nvim wants this too
    bat

    # Dev
    git
    opam # Needed for starship
    gcc
    clang
    nodejs
    rustup
    sccache
    go
    python3
    luajitPackages.luarocks # nvim wants it

    # Environment
    hyprpaper
    hyprshade
    waybar
    swaylock
    kdialog
    dunst
    brightnessctl
    blueman
    networkmanagerapplet
    copyq
    grimblast
    rofi
    bubblewrap # For steam and flatpak
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    lxqt.lxqt-policykit # Polkit agent for Hyprland
    wl-clipboard # Needed for nvim + register
    pinentry-qt # For gpg

    # Themes
    catppuccin-qt5ct
    # papirus-icon-theme
    catppuccin-papirus-folders

    # Gaming and Wine
    protonup-qt
    mangohud
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    # enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?


  # Syncing
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };

  # Other Programs
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  services.flatpak.enable = true;

}
