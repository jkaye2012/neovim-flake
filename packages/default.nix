{ pkgs, ... }: with pkgs; rec {
  packages = [
    nodejs_21
  ];
  packagesPath = lib.makeBinPath packages;
}
