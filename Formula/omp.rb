class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261123-053756-31ffee5/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.1/omp-darwin-arm64"
      sha256 "d5a3324acd98375a01698a1b0c018be48caed2956c8aa9044ad137fe43bc0400"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261123-053756-31ffee5/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.1/omp-darwin-x64"
      sha256 "6ffecb22a9fe01a98f90f91a2ef04a697850a23bf4dde83adad2fe80e51a8353"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261123-053756-31ffee5/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.1/omp-linux-arm64"
      sha256 "f022f720c4899eb24c6e5e34dcbbae98ae05f5532bb03e97dffc02cfc8dd9a6f"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261123-053756-31ffee5/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.1.1/omp-linux-x64"
      sha256 "04e9490f9394da6d6804474cc2e41eb3d18f8e26215df4b34bdd4ad4c0d8a401"
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
