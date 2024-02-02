{ system ? builtins.currentSystem }:
let 
  sources = import ./nix/sources.nix;
  haskell-nix = import sources."haskell.nix" {  };
  pkgs = import sources.nixpkgs (haskell-nix.nixpkgsArgs // { inherit system; });

  project = pkgs.haskell-nix.project' {
    evalPackages = pkgs;
    compiler-nix-name = "ghc981";
    src = ./.;
  };
in
  { test = project.hsPkgs.test.components.library;  }
