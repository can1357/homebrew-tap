class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-080828-eec114a/omp-darwin-arm64",
          using: :nounzip
      sha256 "43adb8d162b6fad626589e2bdc2d9190e8f0e6752ceedef2e04f64c8a12aebff"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-080828-eec114a/omp-darwin-x64",
          using: :nounzip
      sha256 "0d958a17a5c7a8878b49e379025fdbc6c0a5632c4fcbf65887ad4c4dcb693d84"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-080828-eec114a/omp-linux-arm64",
          using: :nounzip
      sha256 "00315df028377d07a1ba18cb901734dcaccfe3c2039481913a86efecc9f78945"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-080828-eec114a/omp-linux-x64",
          using: :nounzip
      sha256 "12b56956bdb3b9fcecd7af7106ddbc4910c9561300ce770d8ca5a7eeecee702c"
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
