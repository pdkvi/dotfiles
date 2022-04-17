NVIMDATA_DIR = $$HOME/.local/share/nvim
CONFIG_DIR = $$HOME/.config

LINKCMD = ln
LINKOPTS = -s -r

DELCMD = rm
DELOPTS = -r -f

PKGMGR = yay
PKGFLAGS = -S --noconfirm --needed

CLANGD_PKG_NAME = clang

all: neovim
clean: neovim_clean

neovim:
	$(LINKCMD) $(LINKOPTS) ./nvim $(CONFIG_DIR)/
	git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		$(NVIMDATA_DIR)/site/pack/packer/start/packer.nvim
	$(PKGMGR) $(PKGFLAGS) $(CLANGD_PKG_NAME)

	nvim --headless -u ./nvim/lua/plugins.lua -c \
		'autocmd User PackerComplete quitall' -c 'PackerSync'

neovim_clean:
	$(DELCMD) $(DELOPTS) $(NVIMDATA_DIR)/site/pack/packer/start
	$(DELCMD) $(DELOPTS) $(CONFIG_DIR)/nvim
