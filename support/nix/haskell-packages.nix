pkgs: super: {
  haskell = super.haskell // {
    packageOverrides = hpkgs: hsuper: {
      Agda = pkgs.haskell.lib.dontCheck (hpkgs.callCabal2nix "Agda" (pkgs.fetchFromGitHub {
        owner = "agda";
        repo = "agda";
        rev = "a52fc3ca191b58e552626988b663bf76c6e8cc42";
        sha256 = "sha256-pkaefBrZDr/1cP7G+uoCtyPDFprFCA6sixJdFNIvuqw=";
      }) {});
    };
  };
}
