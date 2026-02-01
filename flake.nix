{
  description = "NixOS and nix-darwin system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-darwin, home-manager, ... } @ inputs:
  let
    user = "harry";
  in
  {
    darwinConfigurations = (
      import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs nixpkgs-unstable nix-darwin home-manager user;
      }
    );
  };
}
