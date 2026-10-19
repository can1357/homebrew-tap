class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261019-184157-53a0377/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.3/omp-darwin-arm64"
      sha256 "f2a657b3320fcafa23055053940a45b26a8d3254e1412a158838013d670d6ec5"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261019-184157-53a0377/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.3/omp-darwin-x64"
      sha256 "73918ae225fa63bc0686081dce4eb90716540ef94e55185b999c697999f7b2c9"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261019-184157-53a0377/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.3/omp-linux-arm64"
      sha256 "58f7c25e9b729b082192049ada07a31820c8b257325545a5fe232ff1679f1093"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261019-184157-53a0377/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.3/omp-linux-x64"
      sha256 "065b5079d65ff6b77d961c935ba808e8f0f569ca6a2cb7b5fb6a1e8da72d7dec"
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
