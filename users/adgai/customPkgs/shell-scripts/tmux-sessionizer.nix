{ pkgs, ... }:
let
  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    echo "Hello world"
    selected=$({find ~/  ~/Documents/ /mnt/data/ ~/github/ ~/learn -mindepth 1 -maxdepth 1 -type d & echo "/home/adgai/"  }| fzf)

    if [[ -z $selected ]]; then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)
    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s $selected_name -c $selected
        exit 0
    fi

    if ! tmux has-session -t $selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi

    if [[ -z $TMUX ]]; then
        tmux attach-session -t $selected_name
    else
        tmux switch-client -t $selected_name
    fi
    exit
  '';
  test-script = pkgs.writeShellScriptBin "test-script" ''
    echo "test"
  '';
in
{
  home.packages = [ tmux-sessionizer test-script ];
}
