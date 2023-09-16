function set_proxy
	set -x HTTP_PROXY socks5://127.0.0.1:9091
	set -x HTTPS_PROXY socks5://127.0.0.1:9091
end
