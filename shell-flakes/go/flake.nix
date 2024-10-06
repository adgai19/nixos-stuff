{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    devshell.url = "github:numtide/devshell";

    golines = {
      url = "github:segmentio/golines";
      flake = false;
    };
    gotest-tools = {
      url = "github:gotestyourself/gotest.tools";
      flake = false;
    };
    godlv = {
      url = "github:go-delve/delve";
      flake = false;
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
      ];
      systems = [ "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        {
          devshells.default = {
            packages = [
              pkgs.bashInteractive
              pkgs.go
              pkgs.gofumpt
              pkgs.golangci-lint
              pkgs.gomodifytags
              pkgs.protoc-gen-go-grpc
              pkgs.gotests
              pkgs.gotestsum
              pkgs.gotools
              pkgs.protoc-gen-go
              pkgs.iferr
              pkgs.impl
              pkgs.mockgen
              pkgs.reftools
              pkgs.richgo
              pkgs.buf
              pkgs.delve
              pkgs.golines
              pkgs.gotest
            ];

          };

        };
      flake = { };
    };
}
