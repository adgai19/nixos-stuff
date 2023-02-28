{ pkgs }:
let
  nbrun-src = builtins.readFile ./scripts/nbrun;
  nbrun = pkgs.writeShellScriptBin "nbrun" nbrun-src;

  vifmimg-src = builtins.readFile ./scripts/vifmimg;
  vifmimg = pkgs.writeShellScriptBin "vifmimg" vifmimg-src;

  nbparser-src = builtins.readFile ./scripts/nbparser;
  nbparser = pkgs.writeShellScriptBin "nbparser" nbparser-src;
in
{
  home.packages = [ nbrun vifmimg nbparser ];
}
