class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261021-023157-d5cd750/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.5/omp-darwin-arm64"
      sha256 "5e50df9879de9165d5c6df5e48bb5d038737270013cd849e189da7774fb7368b"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261021-023157-d5cd750/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.5/omp-darwin-x64"
      sha256 "a42c5c5f04b8dadae553f1dfdb896d57baa9a26a9ae2265aa54341e6c6759c23"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261021-023157-d5cd750/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.5/omp-linux-arm64"
      sha256 "0af1895adb1ae330e3b58de13d627277efeaaae6e322c3792fd8e6bd9db9aaa1"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261021-023157-d5cd750/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.5/omp-linux-x64"
      sha256 "fdbc8136084c9a10439569157b2af62312e2b0d801cab54c73e89476da798e7e"
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
