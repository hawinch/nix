{ pkgs, user, ... }: {
  users.users.${user} = {
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
