{ pkgs, ...}: with pkgs.vimPlugins; rec {
  plugins = [
    autoclose-nvim
    copilot-vim
    vim-fugitive
    lualine-nvim
    melange-nvim
    nvim-lspconfig
    rustaceanvim
    telescope-nvim

    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    cmp-vsnip
    vim-vsnip

  ];
}
