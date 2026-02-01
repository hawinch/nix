{ pkgs, user, ... }: {
  environment.systemPackages = with pkgs; [
    zsh
  ];

  home-manager.users.${user} = {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ls = "ls -lah --color";
      };

      history.size = 10000;
    };
  };
}
