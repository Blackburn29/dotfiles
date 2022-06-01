DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

#add a source line to ~/.bashrc to source this file if it does not already exist.
if ! grep -q "source.*$DIR/bashrc" ~/.bashrc; then
    echo -e "\nsource $DIR/bashrc\n" >> ~/.bashrc
fi

ln -sf $DIR/../Xresources $HOME/.Xresources

if [ -x "$(command -v xrdb)" ]; then
    echo "Reloading Xresources..."
    xrdb $HOME/.Xresources
fi
