{
  pkgs,
  lib,
  ...
}:
let
  buildInputs = with pkgs; [
    stdenv.cc.cc
    libuv
    zlib
  ];
in
{
  env = {
    LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
  };

  languages = {
    python = {
      enable = true;
      poetry = {
        enable = true;
        activate.enable = true;
        install.enable = true;
      };
    };
  };

  enterShell = ''
    export PYTHONPATH=$PYTHONPATH:$PWD
    . .devenv/state/venv/bin/activate
  '';
}
