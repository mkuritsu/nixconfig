{ inputs, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    package = pkgs.vscodium;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with inputs.vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
        patbenatar.advanced-new-file
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        icrawl.discord-vscode
        editorconfig.editorconfig
        redhat.java
        vscjava.vscode-maven
        pkief.material-icon-theme
        jnoortheen.nix-ide
        sainnhe.everforest
        ms-python.python
        rust-lang.rust-analyzer
        usernamehw.errorlens
        tamasfe.even-better-toml
        enkia.tokyo-night
        theqtcompany.qt-qml
        theqtcompany.qt-core
        theqtcompany.qt-cpp
        theqtcompany.qt-ui
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
      ];
      userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "Tokyo Night";
        "material-icon-theme.folders.theme" = "classic";
        "clangd.arguments" = [
          "--header-insertion=never"
          "--function-arg-placeholders=false"
        ];
        "cmake.configureOnOpen" = false;
        "cmake.configureOnEdit" = false;
        "cmake.showSystemKits" = false;
        "cmake.automaticReconfigure" = false;
        "cmake.enableAutomaticKitScan" = false;
        "editor.codeLens" = false;
        "editor.inlayHints.enabled" = "offUnlessPressed";
        "editor.formatOnSave" = true;
        "workbench.startupEditor" = "none";
        "extensions.ignoreRecommendations" = true;
        "terminal.integrated.enablePersistentSessions" = false;
        "telemetry.feedback.enabled" = false;
        "git.openRepositoryInParentFolders" = "never";
        "files.associations" = {
          "*.cubos" = "json";
        };
        "workbench.editor.empty.hint" = "hidden";
        "editor.fontFamily" =
          "'CaskaydiaMono Nerd Font Mono', 'JetBrainsMono Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "redhat.telemetry.enabled" = false;
        "everforest.italicComments" = false;
        "[qml]" = {
          "editor.defaultFormatter" = "theqtcompany.qt-qml";
        };
        "qt-qml.doNotAskForQmllsDownload" = true;
      };
    };
  };
}
