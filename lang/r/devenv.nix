{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  rPackages = with pkgs.rPackages; [
    # LSP
    languageserver
    lintr

    # Common libraries
    tidyverse
    httpgd
  ];
  rWithPackages = pkgs.rWrapper.override { packages = rPackages; };
  radianWithPackages = pkgs.radianWrapper.override { packages = rPackages; };
in
{
  languages.r = {
    enable = true;
    package = rWithPackages;
    radian.enable = true;
    radian.package = radianWithPackages;
  };
}
