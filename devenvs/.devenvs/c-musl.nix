# mkdir -p ~/.local/share/gcroots
# nix-build ~/.devenvs/c-musl.nix -o ~/.local/share/gcroots/c-musl
#
# nix-shell ~/.devenvs/c-musl.nix --command fish   # enter it, staying in fish

{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz") {
    config = { };
  },
}:
let
  musl = pkgs.pkgsMusl;
in
musl.mkShell.override { stdenv = musl.clangStdenv; } {
  nativeBuildInputs = with musl; [
    pkg-config
    clang-tools
    bear
  ];
  buildInputs = with musl; [
    zlib
    openssl
  ];
  shellHook = ''
    echo "CC=$CC"
  '';
}
