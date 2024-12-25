{ pkgs, ... }: pkgs.writeShellApplication {
  name = "agefile";
  runtimeInputs = with pkgs;[ age age-plugin-yubikey ];
  text = ''
    filename=''${1//.enc/}
    age -d -i ~/.age/identities/identities.txt -o ."$filename" "$1"
    chmod 600 ."$filename"
    $EDITOR ."$filename"
    age -R ~/.age/recipients/rec.txt -o "$1" ."$filename"
    rm -rf ."$filename"
    echo ."$filename"
  '';
}
