function setenv_kubeconfig
    set -q $KUBECONFIG; and return 0

    set --local kubepath ~/.kube
    set --global --export --path KUBECONFIG $kubepath/config
    for file in $kubepath/config.d/*
        set --append KUBECONFIG $file
    end
end
