function set-proxy --wraps='set -x HTTP_PROXY http://127.0.0.1:8118 && set -x HTTPS_PROXY http://127.0.0.1:8118' --description 'alias set-proxy=set -x HTTP_PROXY http://127.0.0.1:8118 && set -x HTTPS_PROXY http://127.0.0.1:8118'
  set -x HTTP_PROXY http://127.0.0.1:8118 && set -x HTTPS_PROXY http://127.0.0.1:8118 $argv
        
end
