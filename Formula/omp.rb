class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261117-212150-276169d/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.1/omp-darwin-arm64"
      sha256 "6bf784a1ae1d3815116019372af27beb9192e1962e939be35643f6712d257c5b"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261117-212150-276169d/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.1/omp-darwin-x64"
      sha256 "b2f04268a036718bff475a95fbcafb360f3b48bafdcc40b3351aaaeb36ef62a2"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261117-212150-276169d/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.1/omp-linux-arm64"
      sha256 "c65dd594ba33efd53274fa3b766bd31f67c070717fac12f9e604d2b5b5469bf9"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261117-212150-276169d/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.1/omp-linux-x64"
      sha256 "ba2d380bc54a6f175a314b49d2f45e82d45e469274362969afbadf2d65423fd6"
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
