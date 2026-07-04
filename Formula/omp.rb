class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "16.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "1a90b5239c55d03bc9c61ac538c8395edd44235535e4a9e7e9453ff9cdb94bbd"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64",
          using: :nounzip
      sha256 "306ec040f7baaadf1c620d648fdb687ee68307bc28d36fb94539fd8cd3a7ac95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "1a47b7fc9a2f434645c8950a48cd71d7837fa876b6a8f86cb1ffdad0caece453"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "9bc463d2a76ab058fff561dd21fd8a67f3c2928bc75eda50b6bebf348d33ff22"
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
