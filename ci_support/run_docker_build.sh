#!/usr/bin/env bash

# NOTE: This script has been automatically generated by github.com/conda-forge/conda-smithy/...

FEEDSTOCK_ROOT=$(cd "$(dirname "$0")/.."; pwd;)
RECIPE_ROOT=$FEEDSTOCK_ROOT/recipe

docker info

config=$(cat <<CONDARC

channels:

 - conda-forge

 - defaults # As we need conda-build

conda-build:
 root-dir: /feedstock_root/build_artefacts

show_channel_urls: True

CONDARC
)

cat << EOF | docker run -i \
                        -v ${RECIPE_ROOT}:/recipe_root \
                        -v ${FEEDSTOCK_ROOT}:/feedstock_root \
                        -a stdin -a stdout -a stderr \
                        pelson/obvious-ci:latest_x64 \
                        bash || exit $?

export BINSTAR_TOKEN=${BINSTAR_TOKEN}
export PYTHONUNBUFFERED=1

echo "$config" > ~/.condarc
# A lock sometimes occurs with incomplete builds. The lock file is stored in build_artefacts.
conda clean --lock

conda update --yes --all

conda info



# Embarking on 6 case(s).

    set -x
    export CONDA_NPY=110
    export CONDA_PY=27
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    

    set -x
    export CONDA_NPY=19
    export CONDA_PY=27
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    

    set -x
    export CONDA_NPY=110
    export CONDA_PY=34
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    

    set -x
    export CONDA_NPY=19
    export CONDA_PY=34
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    

    set -x
    export CONDA_NPY=110
    export CONDA_PY=35
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    

    set -x
    export CONDA_NPY=19
    export CONDA_PY=35
    set +x
    conda build /recipe_root --quiet || exit 1
    
    /feedstock_root/ci_support/upload_or_check_non_existence.py /recipe_root conda-forge --channel=main || exit 1
    
    
EOF
