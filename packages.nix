# declarative package list for tools not available at arch/aur
# the path added at end of $PATH
# Run by: `nix-env -f packages.nix -i`
{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;

[
  nixd
  nixfmt-rfc-style
  devenv
  maturin
  trunk
  cargo-dist
]
