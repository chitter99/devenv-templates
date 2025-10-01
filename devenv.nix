{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  languages.nix.enable = true;
  git-hooks.hooks.nixfmt-rfc-style.enable = true;
  git-hooks.hooks.statix.enable = true;
}
