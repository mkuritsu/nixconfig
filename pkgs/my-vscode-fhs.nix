{pkgs, ...}:
pkgs.vscode.fhsWithPackages (pkgs:
    with pkgs; [
      rustup
      python3
      nodejs
      alejandra
      nixfmt
      nixd
      nil
    ])
