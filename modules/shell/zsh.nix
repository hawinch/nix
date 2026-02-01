{ pkgs, ... }: {
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "ls -lah --color";
    };

    history.size = 10000;
  };
}
