#!/bin/bash
set -e

show_usage() {
    echo "Setup and run stakx"
    echo ""
    echo "Usage: ${0} [option]"
    echo ""
    echo "Options:"
    echo "-b, --build        Build website pages using stakx."
    echo "-d, --doxygen      Build Doxygen documentation."
    echo "-s, --serve        Run website using the internal stakx webserver."
    echo ""
}

build-doxygen() {
    # Keep JACK documenatation up to date
    if [ -d _jack1 ]; then rm -rf _jack1; fi

    git clone --recursive https://github.com/jackaudio/jack1.git _jack1

    pushd _jack1
    if [ ! -f configure ]; then
        ./autogen.sh
    fi
    if [ ! -f Makefile ]; then
        ./configure \
            --enable-force-install \
            --prefix=/usr          \
            --disable-alsa         \
            --disable-firewire
    fi
    rm -rf doc/reference doc/reference.doxygen
    make -j $(nproc)
    popd
    rm -rf api
    mv _jack1/doc/reference/html api
}

main() {
    local STAKX_CMD=stakx
    if [ "${GITHUB_ACTIONS}" = true ]; then STAKX_CMD=./stakx; fi

    for i in "$@"; do
        case $i in
            -b|--build)
                ${STAKX_CMD} build
                shift
                ;;
            -d|--doxygen)
                build-doxygen
                shift
                ;;
            -s|--serve)
                ${STAKX_CMD} serve
                exit 0
                ;;
            *)
                show_usage
                exit 0
                ;;
        esac
    done
}

main "$@"
