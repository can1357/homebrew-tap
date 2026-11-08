class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261108-180744-cb4801a/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.2/omp-darwin-arm64"
      sha256 "a1d696334b64d176832d6bc9f03da0d9227d8eaa9ef625c8cebc9c097d135306"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261108-180744-cb4801a/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.2/omp-darwin-x64"
      sha256 "7a717c265e31959daaa8f25633f1483798b8d02ad774c56e69bd344979786661"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261108-180744-cb4801a/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.2/omp-linux-arm64"
      sha256 "128e1772b2e01bf7ee83cc6810e7efc1e0a5eda87220bad870322f762a9458ab"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261108-180744-cb4801a/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.2/omp-linux-x64"
      sha256 "965cf6038d60603296e41e0cf874ca9116561531f7e296e97ee0a9f84c405e53"
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
