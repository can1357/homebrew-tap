class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261021-210324-45c35e4/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.6/omp-darwin-arm64"
      sha256 "cfbb5e38cd8f8a3be55e710700be587d287deaacdc58c9b0a661c5086bccfe58"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261021-210324-45c35e4/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.6/omp-darwin-x64"
      sha256 "62d6e6fd88b6fa5de2ca82842906f152bf1aa227559b1d0bb386f25f6d606123"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261021-210324-45c35e4/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.6/omp-linux-arm64"
      sha256 "eee8e586274cef2e725c218b2b28b48ca9965d46dd58f60998cb347eca4ad0cf"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261021-210324-45c35e4/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.6/omp-linux-x64"
      sha256 "85d9daf3a05fc76e8cd425ae1904eb576af8d21cc85fcf4690742626e07ccfa4"
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
