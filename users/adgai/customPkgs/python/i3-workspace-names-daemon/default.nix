{...}:
buildPythonPackage rec {
  pname = "i3-workspace-names-daemon";
  version = "0.1";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-OqOfiYMpwhVv9SXfppznCeQtd6qxi/SRdxnW8mCqagg="
    };
    docheck = false;
    meta = {
      description = "i3 workspace names daemon";
      homepage = "https://github.com/cboddy/i3-workspace-names-daemon";
      license = lib.license.mit;
      maintainers = with lib.maintainers; [ ];
      };
};
