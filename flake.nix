{
  description = "A simple Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
      lib = pkgs.lib;
      inherit (import ./packages { inherit pkgs; }) vimPackages packagesPath;
      inherit (import ./plugins { inherit pkgs; }) plugins;
      config = lib.concatMapStrings (x: "luafile ${x}\n") (lib.filesystem.listFilesRecursive ./config);
      neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
        customRC = "${config}";
      } // {
        viAlias = true;
        vimAlias = true;
        packpathDirs.myNeovimPackages.start = plugins;
        wrapperArgs = pkgs.lib.escapeShellArgs [ "--suffix" "PATH" ":" "${packagesPath}" ];
      };
    in
    with pkgs; rec {
      packages.${system}  = rec {
        jkvim = wrapNeovimUnstable neovim-unwrapped neovimConfig;
        default = jkvim;
      };
      apps.${system} = rec {
        jkvim = flake-utils.lib.mkApp {
          drv = packages.${system}.jkvim;
          name = "jkvim";
          exePath = "/bin/nvim";
        };
        default = jkvim;
      };
      devShells.${system}.default = mkShell {
        name = "jkvim";
        packages = vimPackages;
        buildInputs = [
          packages.${system}.jkvim
        ];
      };
    };
}
