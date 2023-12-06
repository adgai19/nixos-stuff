{

  description = "A cursed setup of kafka and zookeeper";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
    devshell.url = "github:numtide/devshell";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.process-compose-flake.flakeModule
        inputs.devshell.flakeModule
      ];
      perSystem = { self', pkgs, lib, ... }: {
        process-compose.default = {
          settings.log_location = "/tmp/shell.log";
          settings.log_level = "debug";
          settings.processes = {
            kafka = {
              command = "${pkgs.apacheKafka}/bin/kafka-server-start.sh ${pkgs.apacheKafka}/config/server.properties";
              # environment = { KAFKA_HEAP_OPTS = "-Xmx256M -Xms128M"; };
            };
            zookeeper = {
              command = " ${pkgs.zookeeper}/bin/zkServer.sh start  /home/aditya/code/kafka/conf/zoo.cfg";
              # args = [ "start-foreground" ];
              environment = {
                ZOO_LOG_DIR = "/tmp/zookeeper";
                ZOO_DATADIR = "/tmp/zookeeper";
                ZOOCFGDIR = "/home/aditya/code/kafka/conf";
              };
            };
          };
        };
        devshells.default = {
          env = [
          ];
          commands = [
            {
              help = "print hello";
              name = "hello";
              command = "echo hello";
            }
            {

              help = "test";
              name = "topics";
              command = "${pkgs.apacheKafka}/bin/kafka-topics.sh --bootstrap-server=localhost:9092 --list";
            }
          ];
          packages = [
          ];
        };

      };
    };

}   
