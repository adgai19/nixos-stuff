{ pkgs, ... }:
let
  tmux-sessionizer-src = builtins.readFile ./scripts/tmux-sessionizer.sh;
  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" tmux-sessionizer-src;
  test-script = pkgs.writeShellScriptBin "test-script" ''
    echo "test"
  '';
in
{
  home.packages = [ tmux-sessionizer test-script ];
}
