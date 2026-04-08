{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    git
    gnupg
  ];

  home-manager.users.${user} = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "hawinch";
          email = "122532162+hawinch@users.noreply.github.com";
        };
      };
    };
  };
}
