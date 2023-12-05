{

  description = "A cursed setup of kafka and zookeeper";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.process-compose-flake.flakeModule
      ];
      perSystem = { self', pkgs, lib, ... }: {
        process-compose.default = {
          settings.environment.FOOBAR = "demo";
          settings.processes = {
            kafka = {
              command = "${pkgs.apacheKafka}/bin/kafka-server-start.sh ${pkgs.apacheKafka}/config/server.properties" ;
              # environment = { KAFKA_HEAP_OPTS = "-Xmx256M -Xms128M"; };
              # dependencies = [ "zookeeper" ];
            };
            zookeeper = {
              command = "${pkgs.zookeeper}/bin/zkServer.sh ${pkgs.apacheKafka}/config/zookeeper.properties";
              # args = [ "start-foreground" ];
              # environment = { ZOO_LOG_DIR = "/tmp/zookeeper"; };
            };
          };
        };

      };
    };

}
