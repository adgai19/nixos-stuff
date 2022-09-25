{ pkgs, ... }:
let
  fzfp-src = builtins.readFile ./scripts/fzfp.sh;
  fzfp = pkgs.writeShellScriptBin "fzfp" fzfp-src;
in
{
  home.packages = [ fzfp ];
}
