export GOROOT_MINE=${HOME}/Workshop/go/mine
export GOROOT_THEIRS=${HOME}/Workshop/go/theirs
export GOPATH=${GOROOT_MINE}:${GOROOT_THEIRS}
export GOROOT=/usr/local/go
PATH=${PATH}:${GOROOT}/bin:${GOROOT_MINE}/bin:${GOROOT_THEIRS}/bin
