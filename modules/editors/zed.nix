{ pkgs, user, ... }: {
  home-manager.users.${user} = {
    home.packages = with pkgs; [
      zed-editor
    ];

    programs.zed-editor = {
      enable = true;

      extensions = [
        "docker"
        "git-firefly"
        "nix"
        "sql"
        "terraform"
        "toml"
        "xml"

        "catppuccin-icons"
        "nvim-nightfox"
      ];

      userSettings = {
        home_format = "hour24";
        vim_mode = true;

        buffer_font_size = 11;
        ui_font_size = 12;

        icon_theme = {
          mode = "system";
          dark = "Catppuccin Mocha";
          light = "Catppuccin Latte";
        };

        theme = {
          mode = "system";
          dark = "Carbonfox - opaque";
          light = "Dawnfox - opaque";
        };

        project_panel = {
          entry_spacing = "standard";
          indent_size = 16;
        };
      };
    };
  };
}
