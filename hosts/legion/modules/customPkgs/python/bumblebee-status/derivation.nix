{ lib, fetchFromGitHub, pytestCheckHook, pytest-freezegun, psutil, pytest-mock, glibcLocales, killall, python3Packages, netifaces }:
python3Packages.buildPythonApplication rec {
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

  meta = with lib; {
    description = "bumblebee-status is a modular, theme-able status line generator for the i3 (and sway) window manager.";
    homepage = "https://github.com/tobi-wan-kenobi/bumblebee-status";
    license = licenses.mit;
    maintainers = with maintainers; [ Deep6 ];
  };
}
