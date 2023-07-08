default: help

arch: get_configs install_omz install_neovim grab_fonts setup_wm

get_configs:
	git submodule update --init --recursive

grab_fonts:
	./scripts/fonts.sh

install_neovim:
	cd ~/.config/nvim && $(MAKE) target=$(target) $(target)

setup_wm:
	cd ~/.config/wm && $(MAKE) default

install_zsh:
	./.scripts/zsh.sh

install_omz: install_zsh
	./.scripts/omz.sh

help:
	@echo "Usage make <step> target=<target>"
	@echo ""
	@echo "Steps:"
	@echo "  arch  sets up nvim repo, wm repo, and other dot files and such"
	@echo ""
	@echo "Valid Targets:"
	@echo "arch"
	@echo "Note, using invalid targets may do something odd, and probably fail, dont do it"
