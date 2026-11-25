class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-083300-46380c2/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-darwin-arm64"
      sha256 "31665fabb4e72f91981f0fa3e3d2ec8f301758cdff9552cc9decd2a9748cd9c4"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-083300-46380c2/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-darwin-x64"
      sha256 "e53b43dc78b5a66c4b2b1dea8757e65e4e8ea1fc08e0bcf1464acd8efd177f15"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-083300-46380c2/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-linux-arm64"
      sha256 "1291fb9a26dfaef418f23c255e80c12a464fd0e556e926de3e66e04b07decdb1"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-083300-46380c2/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-linux-x64"
      sha256 "412fe07570ce802c5971e90a8f69627ec5ee5852cd018fc349ca661061e5b88f"
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
