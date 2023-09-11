function ggu --wraps='gut fetch --all --prune && git pull --rebase' --wraps='git fetch --all --prune && git pull --rebase' --description 'alias ggu git fetch --all --prune && git pull --rebase'
  git fetch --all --prune && git pull --rebase $argv
        
end
