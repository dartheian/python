{
	inputs = {
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils, ... }:
		flake-utils.lib.eachDefaultSystem (system:
			let
			pkgs = import nixpkgs {
				inherit system;
			};
			in
			with pkgs;
			{
				devShells.default = mkShell {
					buildInputs = [
						python313
						python312
						python311
						python310
						python39
						pdm
					];
				};
			}
		);
}

