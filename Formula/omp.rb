class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "15.10.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64"
      sha256 "6b009c12827d11072c5ffb5800494771b0ec0b19f25f238e63d99b82b9c1d731"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64"
      sha256 "7e630e5721b5fc663c6794a545a44a4501bd9b973573e0d3523afeb11c743fbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64"
      sha256 "abea9bfcfd271dd8620791358da56ccd42519081dce99de91c9c538e30ed6631"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64"
      sha256 "933dac86613b8052d20c73e4f0cd4b346be48a52d402821b7c6473fde39664f0"
    end
  end

  def install
    bin.install Dir["omp-*"].first => "omp"
    (bin/"omp").chmod 0555
    generate_completions_from_executable(bin/"omp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omp --version")
  end
end
