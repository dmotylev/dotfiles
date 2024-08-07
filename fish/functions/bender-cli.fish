function bender-cli --description 'alias bender-cli=kubectl exec -it $(kubectl get pod -l app=bender -ojsonpath="{.items[0].metadata.name}") -- bender-cli'
  kubectl exec -it $(kubectl get pod -l app=bender -ojsonpath="{.items[0].metadata.name}") -- bender-cli $argv
        
end
