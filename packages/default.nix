{ pkgs, ... }: with pkgs; rec {
  vimPackages = [
    nodejs_22
    ripgrep
    tmux
  ];
  packagesPath = lib.makeBinPath vimPackages;
}
