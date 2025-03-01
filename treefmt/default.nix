{
  inputs,
  ...
}:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = inputs.stable.legacyPackages.${system};

      treefmt.config = {
        projectRootFile = "flake.nix";

        settings = {
          global.excludes = [
            "LICENSE"
          ];
        };

        programs = {
          nixfmt.enable = true;
          deadnix.enable = true;
          statix.enable = true;
        };
      };
    };
}
