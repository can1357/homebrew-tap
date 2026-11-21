class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261121-143240-a7135b8/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.0/omp-darwin-arm64"
      sha256 "dca5643669ed5e553f707bd065499babd0fe3030696bbb24c9da09c798af5abb"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261121-143240-a7135b8/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.0/omp-darwin-x64"
      sha256 "edf51e3754f3f145298ae6dbfd9e6d5f5ec178e3386f043959ec71f7981c52af"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261121-143240-a7135b8/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.0/omp-linux-arm64"
      sha256 "785e8e519acb55852a85e5495271d768a221ca92c095c043cd3eb0d7f8d3eafc"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261121-143240-a7135b8/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.0/omp-linux-x64"
      sha256 "be2b45c437b623e15c29b1f8c98aacb842f92118196454b5e9eed884359e9a01"
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
