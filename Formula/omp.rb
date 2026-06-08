class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "15.10.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64"
      sha256 "e1f47c856ab78735e0f221e1504bb99a9077c03184eb987e747eb573a712eb47"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64"
      sha256 "d747be4c393ec7483254d8f2afa64fbaba2bd6a441ba6fbdac311e4a027c59ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64"
      sha256 "8f22ff25957c917b71c6db1b3b7df9ea471e79dfe4d37a891b6664b42b4a9bad"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64"
      sha256 "42b84ef1d99690d24c042e0573946423868d7731f8605c1c49bf3d473c0b2a99"
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
