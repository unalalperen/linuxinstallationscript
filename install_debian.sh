#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="$DIR/packages_debian.conf"

if [[ "$1" == "--install" || "$1" == "-i" ]]; then
    if [[ -f "$CONF" ]]; then
        sudo apt-get update >/dev/null && sudo xargs -a "$CONF" apt-get install -y >/dev/null
    else
        echo "Hata: packages_debian.conf bulunamadı!"
        exit 1
    fi
else
    echo "Kullanım: $0 [SEÇENEK]"
    echo ""
    echo "Seçenekler:"
    echo "  --install, -i    packages_debian.conf içerisindeki paketleri kurar"
    echo "  --help, -h       Yardım menüsünü gösterir"
fi
