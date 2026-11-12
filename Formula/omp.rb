class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261112-033623-04cd1a7/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.19.0/omp-darwin-arm64"
      sha256 "d469628ae8b847617087cc987a628868e4cac53deb5f99451c8cfc4eec5e7e8d"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261112-033623-04cd1a7/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.19.0/omp-darwin-x64"
      sha256 "bc2a090133225284e7b8026a75e571fab4ab691532af0540ed2bdc6d1ce8d9aa"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261112-033623-04cd1a7/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.19.0/omp-linux-arm64"
      sha256 "61826bf89c2c0512417fee05fa2f486e60ee11b23ea95a17257a6c49edb6b8d5"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261112-033623-04cd1a7/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.19.0/omp-linux-x64"
      sha256 "b44fda2ae5c9cce2bbe124d1672cba532a136d9e1eef68599b16efcd3bc5c626"
    end
  end

  def install
    bin.install Dir["omp-*"].first => "omp"
    (bin/"omp").chmod 0555
    with_env(HOME: buildpath) do
      generate_completions_from_executable(bin/"omp", "completions", shells: [:bash, :zsh, :fish])
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omp --version")
  end
end
