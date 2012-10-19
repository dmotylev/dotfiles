#!/bin/bash
[ $# -ne 1] && return
ln -s $1/bash .bash1
ln -s $1/bash/profile .bash_profile1
