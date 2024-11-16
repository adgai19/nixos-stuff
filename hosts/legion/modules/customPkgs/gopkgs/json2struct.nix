{ pkgs, inputs, ... }: pkgs.buildGoModule {
  name = "json2struct";
  vendorHash = "sha256-rkjGULrInNsEcq89dDDG9l1iqIIz/U3ox0MXUq8NCXg=";
  src = inputs.json2struct;
  buildInputs = with pkgs;[
    xorg.libX11.dev
  ];
}

