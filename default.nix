{ system ? builtins.currentSystem, compiler-nix-name ? "ghc98" }:
let 
  sources = import ./nix/sources.nix;
  haskell-nix = import sources."haskell.nix" {  };
  
  pkgs = import sources.nixpkgs (haskell-nix.nixpkgsArgs // { inherit system; });

  project = pkgs.haskell-nix.project' {
    inherit compiler-nix-name;
    evalPackages = pkgs;
    src = ./.;
    # fixes the build problem with ghc 9.8.1
    modules = [{
      reinstallableLibGhc = compiler-nix-name != "ghc98" && compiler-nix-name != "ghc981";
    }];
  };
  test = project.hsPkgs.test.components.library;
    
in
  { inherit test pkgs; }
