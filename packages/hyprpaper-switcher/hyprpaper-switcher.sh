# code snippets from: https://github.com/jstkdng/ueberzugpp/blob/master/scripts/fzfub

#!/usr/bin/env bash

case "$(uname -a)" in
    *Darwin*) UEBERZUG_TMP_DIR="$TMPDIR" ;;
    *) UEBERZUG_TMP_DIR="/tmp" ;;
esac

cleanup() {
    ueberzugpp cmd -s "$SOCKET" -a exit
}
trap cleanup HUP INT QUIT TERM EXIT

UB_PID_FILE="$UEBERZUG_TMP_DIR/.$(uuidgen)"
ueberzugpp layer --no-stdin --silent --use-escape-codes --pid-file "$UB_PID_FILE"
UB_PID=$(cat "$UB_PID_FILE")

export SOCKET="$UEBERZUG_TMP_DIR"/ueberzugpp-"$UB_PID".socket

image_dir="$HOME/Pictures/wallbangers/desktop"
if [ ! -z "$1" ]; then
    image_dir=$1
fi
wallpaper="$(find "$image_dir" | fzf --preview="ueberzugpp cmd -s $SOCKET -i fzfpreview -a add \
                            -x \$FZF_PREVIEW_LEFT -y \$FZF_PREVIEW_TOP \
                            --max-width \$FZF_PREVIEW_COLUMNS --max-height \$FZF_PREVIEW_LINES \
                            -f {}")"

ueberzugpp cmd -s "$SOCKET" -a exit

if [[ -n "$wallpaper" ]]; then
    ln -sf "$wallpaper" "$HOME/.config/background"
    pkill hyprpaper
    hyprctl dispatch "exec hyprpaper"
    echo "Wallpaper changed!"
fi