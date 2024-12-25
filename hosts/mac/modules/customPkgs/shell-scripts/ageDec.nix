{ pkgs, ... }: pkgs.writeShellApplication {
  name = "agedec";
  runtimeInputs = with pkgs;[ age age-plugin-yubikey ];
  text = ''
    encrypted_file=$1
    #substring_to_remove=".enc."
    #decrypted_fileyame=$encrypted_file | sed "s/$substring_to_remove/./g"

    age -d -i ~/.age/identities/identities.txt "$encrypted_file"
  '';


}
