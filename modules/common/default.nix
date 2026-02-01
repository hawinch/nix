{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    tree
    watch
  ];

  imports = import (../shell);

  home-manager.users.${user} = {
    home.stateVersion = "25.11";
  };
}
