#!/usr/bin/env bash

# Verifies that yarn.lock is in its cleanest possible state

set -e

datetime=$(date +"%Y%m%d%H%M%S")

version=${1:-$datetime}
outdir=artifacts/${version}

mkdir -p ${outdir}

pkgs=(
icons \
core \
datetime \
"select" \
table \
)

for pkg in ${pkgs[*]}; do
    cd packages/${pkg}
    yarn pack --filename ../../${outdir}/${pkg}.tgz
    cd -

    echo "${outdir}/${pkg}.tar.gz"
done

