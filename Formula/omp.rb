class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261031-011348-c29f7c5/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.1/omp-darwin-arm64"
      sha256 "1cef852c6cb00a86b555efd703efe5192200d302601ff29048e152495362bff9"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261031-011348-c29f7c5/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.1/omp-darwin-x64"
      sha256 "eed7a65291c5bb75534e57634e3b7c5c0a5adfc39457977dcd5ddcbaaa0c5cca"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261031-011348-c29f7c5/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.1/omp-linux-arm64"
      sha256 "1fd31f1c9471a3f8417571cba857de0fa2ec1678b93d5251750120baab3460e6"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261031-011348-c29f7c5/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.1/omp-linux-x64"
      sha256 "02d76a0cfeee473ffa387f50cf0378b0de1c44684c83e67ca27ba4d717cfb0d0"
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
