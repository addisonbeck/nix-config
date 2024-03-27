{
  nixos = { modulesPath, lib, ... }: {
    imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
      (modulesPath + "/virtualisation/digital-ocean-config.nix")
    ];

    nix.settings.experimental-features = "nix-command flakes";

    networking.hostName = "nixos";
    time.timeZone = "America/Chicago";
    deployment.targetHost = "nix.addisonbeck.dev";
    deployment.targetUser = "root";

    swapDevices = [ {
      device = "/var/lib/swapfile";
      size = 4 * 1024;
    } ];
  };
}
