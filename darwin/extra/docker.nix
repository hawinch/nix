{ pkgs, pkgs-unstable, user, ... }: {
  environment.systemPackages = [
    pkgs-unstable.colima
    pkgs.docker
  ];
}
