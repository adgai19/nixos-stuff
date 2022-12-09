{ ... }:
let
  nbrun-src = builtin.readFile ./scripts/nbrun;
  nbrun = pkgs.writeShellScriptBin "nbrun" nbrun-src;

  vifmimg-src = builtin.readFile ./scripts/vifmimg;
  vifmimg = pkgs.writeShellScriptBin "vifmimg" vifmimg-src;

  nbparser-src = builtin.readFile ./scripts/nbparser;
  nbparser = pkgs.writeShellScriptBin "nbparser" nbparser-src;
in
{
  home.packages = [ nbrun vifmimg nbparser ];
}
