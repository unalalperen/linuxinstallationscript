#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="$DIR/packages_arch.conf"

if [[ "$1" == "--install" || "$1" == "-i" ]]; then
    if [[ -f "$CONF" ]]; then
        sudo pacman -S --noconfirm --needed - < "$CONF" >/dev/null
    else
        echo "Hata: packages_arch.conf bulunamadı!"
        exit 1
    fi
else
    echo "Kullanım: $0 [SEÇENEK]"
    echo ""
    echo "Seçenekler:"
    echo "  --install, -i    packages_arch.conf içerisindeki paketleri kurar"
    echo "  --help, -h       Yardım menüsünü gösterir"
fi
