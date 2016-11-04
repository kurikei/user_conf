#!/bin/sh
exec ssh -oIdentityFile=$HOME/.ssh/github_com_rsa "$@"
