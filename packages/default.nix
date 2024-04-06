{ pkgs, ... }: with pkgs; rec {
  vimPackages = [
    nodejs_21
    tmux
  ];
  packagesPath = lib.makeBinPath vimPackages;
}
