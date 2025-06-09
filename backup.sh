git rm -rf .config/gtk-3.0/
git rm -rf .config/hypr/
git rm -rf .config/kitty/
git rm -rf .config/mako/
git rm -rf .config/nvim/
git rm -rf .config/qt5ct/
git rm -rf .config/qt6ct/
git rm -rf .config/starship/
git rm -rf .config/uwsm/
git rm -rf .config/waybar/
git rm -rf .config/wofi/
git rm -rf .config/dolphinrc
git rm -rf .config/filetypesrc

git rm -rf .profile
git rm -rf .tmux.conf
git rm -rf .zprofile
git rm -rf .zshrc

echo "here"
cp -r ~/.config/gtk-3.0/ .config
cp -r ~/.config/hypr/ .config
cp -r ~/.config/kitty/ .config
cp -r ~/.config/mako/ .config
cp -r ~/.config/nvim/ .config
cp -r ~/.config/qt5ct/ .config
cp -r ~/.config/qt6ct/ .config
cp -r ~/.config/starship/ .config
cp -r ~/.config/uwsm/ .config
cp -r ~/.config/waybar/ .config
cp -r ~/.config/wofi/ .config
cp -r ~/.config/dolphinrc .config
cp -r ~/.config/filetypesrc .config

cp -r ~/.profile .
cp ~/.tmux.conf .
cp ~/.zprofile .
cp ~/.zshrc .
