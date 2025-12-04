# declarative package list for tools not available at arch/aur
# the path added at end of $PATH
{
  pkgs ? import <nixpkgs> { },
}:

with pkgs;

[
  nixd
  nixfmt-rfc-style
]
