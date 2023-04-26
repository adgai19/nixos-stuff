{lib, config,pkgs,...}:
let
inherit (lib) mkEnableOption mkIf;
inherit (config.programs.adgai.kubernetes) enable;
in
{
    options.programs.adgai.kubernetes.enable = mkEnableOption {
    default = false;
    description = "Enable Kubernetes support for AdGai";
  };
  config=mkIf enable{
        home.packages = with pkgs; [
      kubernetes
      kind
    ];
        programs.k9s.enable = enable;

  };
  
}
