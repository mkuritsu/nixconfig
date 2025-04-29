{
  config,
  pkgs,
  ...
}:
{
  home.stateVersion = "24.11";
  home.username = "kuritsu";
  home.homeDirectory = "/home/kuritsu";
  programs.home-manager.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };

  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        git_status.disabled = true;
      };
    };

    chromium = {
      enable = true;
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
        { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # privact badger
        { id = "gebbhagfogifgggkldgodflihgfeippi"; } # return youtube dislike
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsor block
        { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
        { id = "kehjfphhkfppnnjhdfhanmehkegdppho"; } # youtube row fixer
      ];
    };

    bash = {
      enable = false;
      enableCompletion = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey  "^[[H"   beginning-of-line
        bindkey  "^[[F"   end-of-line
        bindkey  "^[[3~"  delete-char
      '';
      shellAliases = {
        code = "codium --ozone-platform=wayland";
      };
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-marketplace; [
        patbenatar.advanced-new-file
        catppuccin.catppuccin-vsc
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        icrawl.discord-vscode
        editorconfig.editorconfig
        redhat.java
        pkief.material-icon-theme
        jnoortheen.nix-ide
        ms-python.vscode-pylance
        ms-python.python
        ms-python.debugpy
        rust-lang.rust-analyzer
      ];
      userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "catppuccin.italicComments" = false;
        "catppuccin.italicKeywords" = false;
        "clangd.arguments" = [
          "--header-insertion=never"
          "--function-arg-placeholders=false"
        ];
        "cmake.configureOnOpen" = false;
        "cmake.configureOnEdit" = false;
        "editor.codeLens" = false;
        "editor.inlayHints.enabled" = "offUnlessPressed";
        "material-icon-theme.folders.theme" = "classic";
        "cmake.enableAutomaticKitScan" = false;
        "workbench.startupEditor" = "none";
        "cmake.showSystemKits" = false;
        "cmake.automaticReconfigure" = false;
        "editor.formatOnSave" = true;
        "window.menuBarVisibility" = "toggle";
      };
    };
  };
}
