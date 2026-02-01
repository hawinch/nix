{ inputs, nixpkgs, nixpkgs-unstable, nix-darwin, home-manager, user, ... }:
let
  pkgConfig = system: {
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  };

  defaultModules = hostname: [
    ./base
    (../hosts + "/${hostname}")
    ../modules/common
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
  ];

  mkDarwin = {
    system,
    hostname,
    extra_modules ? []
  }:
    let
      inherit (pkgConfig system) pkgs pkgs-unstable;
    in
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit pkgs pkgs-unstable user; };
      modules = (defaultModules hostname) ++ extra_modules;
    };
in
{
  greyslab = mkDarwin {
    system = "aarch64-darwin";
    hostname = "greyslab";
    extra_modules = [
      ../modules/editors/zed.nix
    ];
  };
}
