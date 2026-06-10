class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "15.10.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64"
      sha256 "9294b55ca72388b3b656b77ddf95a2886fe4375e4b0613c133fffd64bdf115b6"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64"
      sha256 "35018e5ab2d6f00658485915db310df40fa98f83b809bfa238ebda4625a8b962"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64"
      sha256 "13771e0f868beaba3f8cf8e164fca3cf1d61ac1b1f2b76c61772921545e7db38"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64"
      sha256 "90e1d4ebd105c2dfeda1d7d8246a164e27aac31555df1c84c7d452598764c4af"
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
