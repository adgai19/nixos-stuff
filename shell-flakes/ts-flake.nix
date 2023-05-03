{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShell = pkgs.mkShell {
          nativeBuildInputs = [
            pkgs.bashInteractive
            pkgs.nodejs-16_x
            pkgs.yarn
            pkgs.nodePackages.ts-node
            # pkgs.nodePackages.typescript
          ];
          buildInputs = [ ];
          # NODE_OPTIONS="--openssl-legacy-provider";
        };
      });
}
