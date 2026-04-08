{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    fzf
  ];

  home-manager.users.${user} = {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
