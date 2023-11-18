{ pkgs, ... }:

{
  services.apache-kafka.enable = false;
  services.zookeeper.enable = false;
}
