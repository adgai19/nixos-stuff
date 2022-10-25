{lib, pkgs,  ... }:
let 
  bumblebee-status = pkgs.pythonPackages.buildPythonPackage rec {
    pname = "bumblebee-status";
    version = "2.1.5";
  src = pkgs.pythonPackages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-hbU/S+i431Uvxar7bN2TEKLodn3hNZAY/ZE0Y28PfaQ=";
  };
  doCheck = false;

  };
in {
  home.packages = [bumblebee-status];
}
