{ pkgs, ... }: with pkgs; rec {
  vimPackages = [
    nodejs_21
    ripgrep
    tmux
  ];
  packagesPath = lib.makeBinPath vimPackages;
}
