class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-193606-1891f38/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.5/omp-darwin-arm64"
      sha256 "8696ca418df9f50a637d3c866948676cb97abb2968af16ee8905d37ae1e08237"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-193606-1891f38/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.5/omp-darwin-x64"
      sha256 "a04e3d1aea29c56549855c62a7be64a5884a0f841ae16192664882b50756ef84"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-193606-1891f38/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.5/omp-linux-arm64"
      sha256 "c7f4c1b082d46b3b459c10657a26fcabc4e06ff793a2a0883b4e99ec15b7ebaa"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-193606-1891f38/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.5/omp-linux-x64"
      sha256 "cdf72cc81afcb0258d6e471c64211854e7516eb73e5be943a0cf30c19fe0deaa"
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
