{
  description = "go env flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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


    cobra-cli = {
      url = "github:spf13/cobra-cli";
      flake = false;
    };

    cobra = {
      url = "github:spf13/cobra-cli";
      flake = false;
    };

    autorestart = {
      url = "github:githubnemo/CompileDaemon";
      flake = false;
    };

  };

  outputs = { self, nixpkgs, golines, godlv, gotest-tools, autorestart, cobra, cobra-cli }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
      autorestart = pkgs.buildGoModule {
        pname = "autorestart";
        src = inputs.autorestart;
        vendorSha256 = "sha256-vRJg+G7VwGqevW9okE/7p/0kp5pb4NAS4eklq83ZQSQ=";
        name = "autorestart";
        proxyVendor = true;
        doCheck = false;
        subPackages = [ "." ];
      };
      gotest = pkgs.buildGoModule {
        pname = "gotest.tools";
        src = inputs.godlv;
        vendorSha256 = null;
        name = "gotest-tools";
        proxyVendor = true;
        doCheck = false;

      };

      cobra = pkgs.buildGoModule {
        pname = "cobra-cli";
        src = inputs.cobra;

        vendorSha256 = "sha256-1LZKsvZcSgFYeXFqgJx6P3YG4H3mqyg5SLTZBye99bM=";
        name = "cobra-cli";
        proxyVendor = true;
        doCheck = false;
      };
      cobra-cli = pkgs.buildGoModule  {
        pname = "cobra-cli";
        src = inputs.cobra-cli;

        vendorSha256 = "sha256-1LZKsvZcSgFYeXFqgJx6P3YG4H3mqyg5SLTZBye99bM=";
        name = "cobra-cli";
        proxyVendor = true;
        doCheck = false;
      };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.bashInteractive
          pkgs.go
          pkgs.golangci-lint
          pkgs.gofumpt
          pkgs.iferr
          pkgs.impl
          pkgs.gotestsum
          pkgs.gomodifytags
          pkgs.mockgen
          pkgs.richgo
          pkgs.gotools
          pkgs.gotests
          pkgs.reftools
          pkgs.nodePackages.nodemon
          golines
          godlv
          gotest
          autorestart
          cobra-cli
          cobra
        ];

        buildInputs = [ ];
        PATH = "$PATH:$(go env GOPATH)/bin";
      };
    };
}
