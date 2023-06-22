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
        let
          golines = pkgs.buildGoModule {
            pname = "golines";
            src = inputs.golines;
            vendorSha256 = "sha256-It7lD8Ix9oX8xXILCnWUfit9ZlPJ4zjMElNa14mCkGI=";
            name = "golines";
            proxyVendor = true;
          };
          godlv = pkgs.buildGoModule {
            pname = "dlv";
            src = inputs.godlv;
            vendorSha256 = null;
            name = "dlv";
            proxyVendor = true;
            doCheck = false;
          };
          gotest = pkgs.buildGoModule {
            pname = "gotest.tools";
            src = inputs.godlv;
            vendorSha256 = null;
            name = "gotest-tools";
            proxyVendor = true;
            doCheck = false;

          };
        in
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
              godlv
              golines
              gotest
            ];

          };

        };
      flake = { };
    };
}
