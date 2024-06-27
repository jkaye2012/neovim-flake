{ pkgs, ...}: with pkgs.vimPlugins; rec {
  plugins = [
    copilot-vim
    vim-fugitive
    lualine-nvim
    melange-nvim
    mini-nvim
    nvim-lspconfig
    nvim-web-devicons
    oil-nvim
    readline-vim
    telescope-nvim
    vim-easymotion
    vim-wordmotion
    which-key-nvim

    # Completion
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    nvim-cmp
    cmp-vsnip
    vim-vsnip
  ];
}
