{ pkgs, ...}: with pkgs.vimPlugins; rec {
  plugins = [
    autoclose-nvim
    copilot-vim
    vim-fugitive
    lualine-nvim
    melange-nvim
    mini-nvim
    nvim-lspconfig
    readline-vim
    rustaceanvim
    telescope-nvim
    vim-easymotion
    vim-wordmotion
    which-key-nvim

    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    cmp-vsnip
    vim-vsnip
  ];
}
