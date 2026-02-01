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

  mkDarwin = {
    system,
    hostname,
    extra_modules ? [],
    extra_hm_modules ? [],
  }:
    let
      inherit (pkgConfig system) pkgs pkgs-unstable;
    in
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs system pkgs pkgs-unstable user; };

      modules = [
        ./base.nix
        (../hosts + "/${hostname}")
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = import (../modules/shell) ++ extra_hm_modules;
        }
      ] ++ extra_modules;
    };
in
{
  greyslab = mkDarwin {
    system = "aarch64-darwin";
    hostname = "greyslab";
    extra_hm_modules = [
      ../modules/editors/zed.nix
    ];
  };
}
