{ user, ... }: {
  networking = {
    hostName = "greyslab";
  };

  home-manager.users.${user} = {
    home.stateVersion = "25.11";
  };

  system = {
    stateVersion = 6;
  };
}
