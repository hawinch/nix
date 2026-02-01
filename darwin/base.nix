{ user, ... }: {
  users.users.${user} = {
    home = "/Users/${user}";
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
