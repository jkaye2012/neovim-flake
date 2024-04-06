{ pkgs, ... }: with pkgs; rec {
  packages = [
    nodejs_21
    tmux
  ];
  packagesPath = lib.makeBinPath packages;
}
