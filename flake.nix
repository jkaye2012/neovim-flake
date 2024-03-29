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
      inherit (import ./packages { inherit pkgs; }) packagesPath;
      inherit (import ./plugins { inherit pkgs; }) plugins;
      neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
      	customRC = ''
          luafile ${./config/general.lua}
          luafile ${./config/status_line.lua}
          luafile ${./config/lsp.lua}
          luafile ${./config/completion.lua}
          luafile ${./config/keybindings.lua}
          luafile ${./config/theme.lua}
	'';
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
      devShell = mkShell {
        buildInputs = [
          packages.${system}.jkvim
        ];
      };
    };
}
