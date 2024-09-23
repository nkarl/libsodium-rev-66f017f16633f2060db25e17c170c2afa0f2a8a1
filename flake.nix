{
    description = "IOHK libsodium?rev=66f017f16633f2060db25e17c170c2afa0f2a8a1";

    inputs =
    {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs =
    {
        self,
        nixpkgs,
        flake-utils
    }: 
    with flake-utils.lib; eachDefaultSystem (system: 

        let pkgs = nixpkgs.legacyPackages.${system};

            in rec {

                packages = { 
                    libsodium = pkgs.stdenv.mkDerivation {
                        name = "secp256k1";
                        src = builtins.fetchGit {
                            url = "https://github.com/nkarl/libsodium-rev-66f017f16633f2060db25e17c170c2afa0f2a8a1";
                            rev = "66f017f16633f2060db25e17c170c2afa0f2a8a1";
                        };

                    nativeBuildInputs = [
                        pkgs.autoreconfHook
                    ];

                    runCommand = ''
                        ./autogen.sh && \
                        ./configure --prefix=$out && \
                        make && \
                        make install
                    '';
            };
        };

        defaultPackage = packages.libsodium;
    });
}
