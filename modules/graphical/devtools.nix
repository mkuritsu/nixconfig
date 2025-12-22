{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # rust
    cargo
    clippy
    rustc
    rustfmt

    # java
    openjdk

    # c/c++
    clang
    gcc
    gdb
    valgrind
    cmake
    ccache
    ninja

    # python
    uv
    (python3.withPackages (pypkgs: [
      pypkgs.requests
      pypkgs.numpy
      pypkgs.pandas
      pypkgs.matplotlib
    ]))
  ];
}
