{ pkgs, config, lib, ... }:
let
  inherit (lib) mkEnableOption mkIf;
  inherit (config.programs.adgai.cli.lf) enable;
in
{
  options.programs.adgai.cli.lf = {
    enable = mkEnableOption "lf";
  };
  config = mkIf enable {
    programs.lf = {

      inherit enable;
      settings = {
        icons = true;
        shell = "sh";
        shellopts = "-eu";
        ifs = "\n";
      };
      keybindings = {
        x = "$$f";
        "<enter>" = "shell";
        o = "&mimeopen $f";
        O = "$mimeopen --ask $f";
        r = "push :rename<space>";
        md = "push :mkdir<space>";
        mf = "push :mkfile<space>";
        "." = "set hidden!";
        p = "paste";
        c = "cut";
        y = "copy";
        D = "$rm -rf $fx";
        "<c-n>" = "down";
        "<c-p>" = "up";
        "<esc>" = "quit";
        m = null;
      };
      commands = {
        rename = "%[ -e $1 ] && printf 'file exists' || mv $f $1";
        mkdir = "%[ -e $1 ] && printf 'dir exists' || mkdir $1";
        mkfile = "%[ -e $1 ] && printf 'file exists' || touch $1";
        delete = "rm -rf $f";
        gitmv = "";


      };
    };
    home.packages = [ pkgs.perl540Packages.FileMimeInfo ];
    home.file."lf-config" =
      {
        source = ../config/lf/icons;
        target = "/home/adgai/.config/lf/icons";

      };
  };
}
