{ pkgs, ... }: pkgs.writeShellApplication {
  name = "agefile";
  runtimeInputs = with pkgs;[ age age-plugin-yubikey ];


  text = ''
    age -d -i ~/.age/identities/identities.txt -o .temp "$1"
    chmod 600 .temp
    $EDITOR .temp
    age -R ~/.age/recipients/rec.txt -o "$1" .temp
    rm -rf .temp
  '';


}
