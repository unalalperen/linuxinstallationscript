#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="$DIR/packages_fedora.conf"

if [[ "$1" == "--install" || "$1" == "-i" ]]; then
    if [[ -f "$CONF" ]]; then
        sudo xargs -a "$CONF" dnf install -y >/dev/null
    else
        echo "Hata: packages_fedora.conf bulunamadı!"
        exit 1
    fi
else
    echo "Kullanım: $0 [SEÇENEK]"
    echo ""
    echo "Seçenekler:"
    echo "  --install, -i    packages_fedora.conf içerisindeki paketleri kurar"
    echo "  --help, -h       Yardım menüsünü gösterir"
fi
