class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.20.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261114-200925-7c49c11/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.2/omp-darwin-arm64"
      sha256 "e2de0974ce581bfcf2044ea795c712fa240fdf8304f7bdb4b3d81b154d2b57fc"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261114-200925-7c49c11/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.2/omp-darwin-x64"
      sha256 "4896674a500de3e0aed700077c67739ce6aea5ecd61d100fff174143daca693b"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261114-200925-7c49c11/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.2/omp-linux-arm64"
      sha256 "7f809e51638c2ace701244923d5ec62485bbafd74db75da742ace30c87a91ebf"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261114-200925-7c49c11/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.2/omp-linux-x64"
      sha256 "f34cfa57311ed67a45f01bb1a21519cad4d74875d181316f00fa0cd6a4abcaaa"
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
