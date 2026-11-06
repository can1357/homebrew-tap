class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261106-051327-75e7801/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.17.0/omp-darwin-arm64"
      sha256 "51f2836f267a8ba6c12cfb50f80e75f0301ccfb1bd53535fc6f9df03199da364"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261106-051327-75e7801/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.17.0/omp-darwin-x64"
      sha256 "1d953be66433df725aaf8d70e19d954fd982f67fd022c164a6cfca6d853f1d20"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261106-051327-75e7801/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.17.0/omp-linux-arm64"
      sha256 "a9423fd7a69d869bf514931226b21d4ff55474225f574e2911fec457fc470e68"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261106-051327-75e7801/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.17.0/omp-linux-x64"
      sha256 "a4ce6001ab1012ca835f4184d675437531bd1ac477a7ba8424ed0b5476e9e4cb"
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
