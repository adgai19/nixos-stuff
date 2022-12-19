{ ... }: {
  programs.lf = {
    enable = true;
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


    };
  };

  home.file."lf-config" =
    {
      source = ../config/lf/icons;
      target = "/home/adgai/.config/lf/icons";

    };



}

# cmd extract ${{
#     set -f
#     case $f in
#         *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
#         *.tar.gz|*.tgz) tar xzvf $f;;
#         *.tar.xz|*.txz) tar xJvf $f;;
#         *.zip) unzip $f;;
#         *.rar) unrar x $f;;
#         *.7z) 7z x $f;;
#     esac
# }}
#
# # compress current file or selected files with tar and gunzip
# cmd tar ${{
#     set -f
#     mkdir $1
#     cp -r $fx $1
#     tar czf $1.tar.gz $1
#     rm -rf $1
# }}
#
# # compress current file or selected files with zip
# cmd zip ${{
#     set -f
#     mkdir $1
#     cp -r $fx $1
#     zip -r $1.zip $1
#     rm -rf $1
# }}
