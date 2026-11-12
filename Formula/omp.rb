class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261112-234053-c308970/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.0/omp-darwin-arm64"
      sha256 "2b1309b06a743ae939708f939b63f75c7a436ed08c7953309f0e387e0c793ead"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261112-234053-c308970/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.0/omp-darwin-x64"
      sha256 "dcd8387f88d32a599451c21c3f402bdc2364243e9e6e5630ff7eec7a8638c4f6"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261112-234053-c308970/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.0/omp-linux-arm64"
      sha256 "8b5e197db7c58b7ebabf83c6f03597f89bae3a766a84c6481b3a942a125f5e22"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261112-234053-c308970/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.20.0/omp-linux-x64"
      sha256 "c8694be8c6e6a1f45e3636dd8a8e9eaa78878ad629a89000b403ec5e456d3f89"
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
