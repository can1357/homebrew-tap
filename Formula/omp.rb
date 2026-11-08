class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261108-002540-2443906/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.1/omp-darwin-arm64"
      sha256 "ce80099f10c5ea4367523767230cb5b920f30cc139b9cf8758c1cc4b2f1f9409"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261108-002540-2443906/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.1/omp-darwin-x64"
      sha256 "b4ae3bc731c37469b487d03e633b9bebf4f452fb9d9c61a99fa23f773a1e1724"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261108-002540-2443906/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.1/omp-linux-arm64"
      sha256 "3bd7699fe7ea63a8eb14f27290d9d3c6a56e55388bef6c560cb139d809330528"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261108-002540-2443906/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.1/omp-linux-x64"
      sha256 "2a75e16550676783b3bc8be0e06513478dd5881efc647954642ab30db8f9be06"
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
