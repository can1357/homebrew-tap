class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261028-125026-413d278/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.3/omp-darwin-arm64"
      sha256 "b449d0d0d779a0b2e655f0ce41d5c414a253de71c67b3affc30a6528fc967314"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261028-125026-413d278/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.3/omp-darwin-x64"
      sha256 "cfd47dc46d028bbdfc220ccb1fdd40af7a82a4e182cb3c2fd1d66a8c20d90326"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261028-125026-413d278/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.3/omp-linux-arm64"
      sha256 "981f08df6c6344356b31aa696fdd810b8b5fa8c8851ba926d3940e793d47cc3a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261028-125026-413d278/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.3/omp-linux-x64"
      sha256 "42d39fa8996fed9f999e26306e60e2fdbea0c0de0d0b2d68feba275f44c41d04"
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
