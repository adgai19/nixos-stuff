{ pkgs, ... }: pkgs.writeShellApplication {
  name = "ageenc";
  runtimeInputs = with pkgs;[ age age-plugin-yubikey ];
  text = ''
    file_path=$1

    # Get the filename with extension
    filename_with_extension=$(basename "$file_path")

    # Get the filename without extension
    filename_without_extension=''${filename_with_extension%.*}

    # Get the extension
    file_extension=''${filename_with_extension##*.}
    dirpath=$(dirname "$file_path")

    age -R ~/.age/recipients/rec.txt -o "$dirpath""/""$filename_without_extension"".enc.""$file_extension" "$file_path"
  '';


}
