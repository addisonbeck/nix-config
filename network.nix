{
  nix.addisonbeck.dev = { modulesPath, lib, ... }: {
    imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
      (modulesPath + "/virtualisation/digital-ocean-config.nix")
    ];

    deployment.targetHost = "159.65.168.64";
    deployment.targetUser = "root";
  };
}
