class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-152818-6f03614/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.21.0/omp-darwin-arm64"
      sha256 "0f8b23c275682c5adaae373bdfe377c8800ebc7ba07b31959a2328ff7a5deaa1"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-152818-6f03614/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.21.0/omp-darwin-x64"
      sha256 "c3acca1e25239338b30f8f7edc1fc7a4f462e2b8ea9e7a5b95830a82c62a1d30"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-152818-6f03614/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.21.0/omp-linux-arm64"
      sha256 "3a3f3f1af115100670d555624a64069f32a0cc8c7ff43d721fa0ddef6c83b312"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-152818-6f03614/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.21.0/omp-linux-x64"
      sha256 "b00bd7ecdf7ad24d103ea56850969c9a8cc050527e1b9db64c25bbbf13fbedcc"
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
