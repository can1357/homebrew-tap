class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261107-014943-b5a6b2f/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.0/omp-darwin-arm64"
      sha256 "0adae2a341a1e6840b00c96ce0b1c9d2e0257b1ea6782e4302e17b717a6ffb0a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261107-014943-b5a6b2f/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.0/omp-darwin-x64"
      sha256 "ee7dc4c9697b4dca7c4cc9219c26f771cec3d6848f1ed63592ad5463021bf9f0"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261107-014943-b5a6b2f/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.0/omp-linux-arm64"
      sha256 "b394bfbf7c0e0ba82e01913defb5fadf14a6ea5a71ee05348070ab5e40187144"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261107-014943-b5a6b2f/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.0/omp-linux-x64"
      sha256 "ec271e0d7df4c0f57acb6a7a28f8585d46bd050bcef8494f6d33db8a6c0dfbba"
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
