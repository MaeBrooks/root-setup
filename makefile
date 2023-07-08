DOT_FILES_REPO=ssh://github.com:maebrooks/dot-files
WM_REPO=ssh://github.com:maebrooks/wm_config

def:
	@echo "IS WM_REPO SETUP"
	@echo "IS DOT FILES REPO SETUP"
	@echo "IS NVIM REPO SETUP"
	@echo "IS GIT_FONT_URL SETUP"

default: arch

arch: install_omz install_neovim install_dot_files setup_wm grab_fonts

grab_fonts:
	./scripts/fonts.sh

install_neovim:
	./.scripts/neovim.sh

install_dot_files:
	./.scripts/dotfiles.sh

setup_wm:
	./.scripts/wm.sh

install_zsh:
	./.scripts/zsh.sh

install_omz: install_zsh
	./.scripts/omz.sh
