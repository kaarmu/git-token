let 
  nixpkgs = import <nixpkgs> {};
  inherit (nixpkgs) lib stdenv git gnupg;
in stdenv.mkDerivation {
  pname = "git-token";
  version = "0.1.0";
  src = ./.;

  buildInputs = [ git gnupg ];

  installPhase = ''
    mkdir -p $out/bin/
    install -m=775 ./git-token $out/bin
  '';

  meta = with lib; {
    homepage = "https://github.com/kaarmu/git-token";
    description = "Manage git tokens with password protected files.";
    maintainers = with maintainers; [ kaarmu ];
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
