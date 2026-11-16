class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.20.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-013900-9093536/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.3/omp-darwin-arm64"
      sha256 "979884efdb84d48ab0401279d3669e71c003922e3e0b50689b8901a4b356e85a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-013900-9093536/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.3/omp-darwin-x64"
      sha256 "388fc0dc7609649c7caa7533378ea5673ed8583e501fabafb0179258f609e6c3"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-013900-9093536/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.3/omp-linux-arm64"
      sha256 "eaa8c4d324b8a54835b3194ba6cb17f849393dd8142745f3a25f70e982a68aa8"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-013900-9093536/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.3/omp-linux-x64"
      sha256 "f34ec9b0f0c368f1937701e2fe111b3c29a7cf53314a642448b3c6cf2925d85a"
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
