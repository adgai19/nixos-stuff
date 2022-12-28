{ pkgs, ... }: {
  home.packages = with pkgs;[ bat exa fd nixpkgs-fmt ];
}
