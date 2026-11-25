class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-085849-5c5ecb1/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-darwin-arm64"
      sha256 "56cf390ea50791ba089878318d0107a959c6f05c3fb9ad7d422023282be3926f"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-085849-5c5ecb1/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-darwin-x64"
      sha256 "e56583001be5abf63c70783c48ae287c9c64469261adf4a544e3076b7878ba7f"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-085849-5c5ecb1/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-linux-arm64"
      sha256 "5e30bfb1d1dab1778d24c576ddb23c942db3159f536a805abb4cda661fd607fb"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-085849-5c5ecb1/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.0/omp-linux-x64"
      sha256 "74cb641d3fcdc22fa3f2141dafa4e66c9fc581d7d2d71753e690160980472c31"
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
