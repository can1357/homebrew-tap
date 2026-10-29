class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261029-182540-31147f9/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.0/omp-darwin-arm64"
      sha256 "608843959ab34295d52460dd09dd7d548b6c903c08a83c67954c2d4c36fd1f5a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261029-182540-31147f9/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.0/omp-darwin-x64"
      sha256 "fc119dff47f99569e32b0a2b10c25db9733ac6faef6ca005539b6e6f610e5984"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261029-182540-31147f9/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.0/omp-linux-arm64"
      sha256 "dba8d170499709bc87359e02e677821aa76a6ef998ca0254578fe4ea07aff5bc"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261029-182540-31147f9/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.0/omp-linux-x64"
      sha256 "e7dd2b606c4ebe9d1a7bcfad1b8820db968cd6b05409fed1c6bc8db0b6a95a8f"
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
