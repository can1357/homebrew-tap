class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "15.11.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64"
      sha256 "7b737613d1c101f28f094419a994fb89b5e9348e4b12647c7f206d6b23e8cd69"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64"
      sha256 "ef35985dcfd5883eb75da29598e925928f57cc582b18a6e85482be3367fb69b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64"
      sha256 "2f008f8046d43afff143bc0a268ce897cd5a333a0cd86cc5db91a1858e1ccb23"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64"
      sha256 "2b8e0aad348713ff1a8cf7537b88252200beb9e035e3d7e93659883430d5a06f"
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
