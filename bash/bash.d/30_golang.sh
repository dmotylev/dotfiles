GOROOT=$(brew --prefix go)
export GOPATH=${HOME}/Workshop/go
PATH=${PATH}:${GOROOT}/libexec/bin:${GOPATH}/bin
unset GOROOT
