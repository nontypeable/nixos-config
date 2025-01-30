{
  inputs,
  ...
}:

{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem = _: {
    treefmt.config = {
      projectRootFile = "flake.nix";
      settings = {
        global.excludes = [];
      };

      programs = {
        deadnix.enable = true;
        statix.enable = true;
        nixfmt.enable = true;
      };
    };
  };
}
