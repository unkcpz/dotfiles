# declarative package list for tools not available at arch/aur
# the path added at end of $PATH
# Run by: `nix-env -f packages.nix -i`

# remove item from list and run: `nix-env -f packages.nix -ir`

# update channel by `nix-channel --update`

{
  stablePkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz") {
    config = { };
  },
  pkgs ? import <nixpkgs> { },
}:

(with stablePkgs; [
  neovim
  tree-sitter
  nixd
  nixfmt-rfc-style
  trunk
  cargo-dist
  nodejs
  vtsls
  firefox
  eslint_d
  grpc-health-probe
  opencode
  traceroute
  atuin
  wget
  uv
  vim
])
++ (with pkgs; [
  devenv
  maturin
  graphviz
  grpcurl
  bun
  zathura
  zathuraPkgs.zathura_pdf_poppler
])
