{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "hawinch";
        email = "122532162+hawinch@users.noreply.github.com";
      };
    };
  };
}
