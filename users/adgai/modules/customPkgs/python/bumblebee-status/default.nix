{ lib, buildPythonPackage, fetchFromGitHub, pytestCheckHook, pytest-freezegun, psutil, netifaces, pytest-mock, glibcLocales, killall }:

buildPythonPackage rec {
  pname = "bumblebee-status";
  version = "2.1.5";

  src = fetchFromGitHub {
    owner = "tobi-wan-kenobi";
    repo = "bumblebee-status";
    rev = "v${version}";
    sha256 = "M3onP+5YEB2CaUqU1g4g9iutbwmGtYKrFcE7jvxNfL0=";
  };

  checkInputs = [
    glibcLocales
    pytestCheckHook
    pytest-freezegun
    psutil
    netifaces
    pytest-mock
    killall
  ];

}
