{...}: {
  programs.git = {
    enable = true;
    userName = "mkuritsu";
    userEmail = "mkuritsuu@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
