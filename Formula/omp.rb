class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.20.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261114-172941-b7fe8c7/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.1/omp-darwin-arm64"
      sha256 "2a080bfd790309001ea001140382a5850be284e984c2f8678a81a41a37e77490"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261114-172941-b7fe8c7/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.1/omp-darwin-x64"
      sha256 "33718063c971cdfd3b249fd13d6821935d78ec18608c3d9c33491c0a3a3a251c"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261114-172941-b7fe8c7/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.1/omp-linux-arm64"
      sha256 "21305158dbdecfa771b72a62254831d60be6b96726245877c25324a4b9988f76"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261114-172941-b7fe8c7/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.1/omp-linux-x64"
      sha256 "24bef5a44d6db0d8f6e8f677404b9a7f1dde3c5e500c435290a3be71bb4dec2a"
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
