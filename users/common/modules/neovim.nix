{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.neovim
  ] ++ (with pkgs; [
    fd
    git
    gnumake
    luajitPackages.lua-lsp
    markdown-oxide
    nil
    nixd
    pyright
    python313Packages.python-lsp-server
    shellcheck
    lua-language-server
  ]);
}
