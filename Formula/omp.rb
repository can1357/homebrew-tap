class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261110-202405-e325ffc/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.7/omp-darwin-arm64"
      sha256 "0cecaac781d3c37f32ff7ecf3b6ba94842e7f058358e4748d5071d772f0aa4df"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261110-202405-e325ffc/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.7/omp-darwin-x64"
      sha256 "c456307d8fb6f2e31fd29f242da678b83bf5258a73ce42c06e951c68dbb99998"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261110-202405-e325ffc/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.7/omp-linux-arm64"
      sha256 "297dbd6dafb2f21277891b75471dc6c16e44ead0d39cfa7f0cd9dc3447c8a79e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261110-202405-e325ffc/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.7/omp-linux-x64"
      sha256 "ea6c216feb260a3766a591760aad06bdc608efd5c632912603f5ccb41b0a4bb1"
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
