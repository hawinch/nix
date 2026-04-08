{ ... }: {
  networking = {
    hostName = "greyslab";
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    stateVersion = 6;
  };
}
