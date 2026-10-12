class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-011910-b83200e/omp-darwin-arm64",
          using: :nounzip
      sha256 "96e205205b484c7fa32c6f299694d5802904e4d412f831652984d5b17b26e451"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-011910-b83200e/omp-darwin-x64",
          using: :nounzip
      sha256 "e8045d6509db221e4bdcb17c21a2578662fe63f10a3539592f05a8a91985398e"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-011910-b83200e/omp-linux-arm64",
          using: :nounzip
      sha256 "1453e506375e280c809815b6a90bbc58ec1eafaab30d330c2d4be56726256043"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-011910-b83200e/omp-linux-x64",
          using: :nounzip
      sha256 "d5c6f92cabc231b4fb94c47322fc67b3c473c3b107339237a4b2f16505b38342"
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
