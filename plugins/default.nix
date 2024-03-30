{ pkgs, ...}: with pkgs.vimPlugins; rec {
  plugins = [
    autoclose-nvim
    copilot-vim
    vim-fugitive
    lualine-nvim
    melange-nvim
    nvim-lspconfig
    readline-vim
    rustaceanvim
    telescope-nvim
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
