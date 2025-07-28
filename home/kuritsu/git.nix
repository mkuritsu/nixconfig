{...}: {
  programs.git = {
    enable = true;
    userName = "mkuritsu";
    userEmail = "rodrigoalexccorreia@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
