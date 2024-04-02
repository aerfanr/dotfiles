function ff --wraps='rg --files -0 | xargs -0 dirname | sort -u | fzf' --description 'alias ff rg --files -0 | xargs -0 dirname | sort -u | fzf'
  rg --files -0 | xargs -0 dirname | sort -u | fzf $argv
        
end
