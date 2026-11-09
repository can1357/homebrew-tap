class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-035940-21f1188/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.3/omp-darwin-arm64"
      sha256 "87e8e593046dfb1047e359ad845648ffc8bda91aa59a9785690d5107f562c32d"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-035940-21f1188/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.3/omp-darwin-x64"
      sha256 "8c09dd1afafca855e817f5eb4f865a16fd31bb47a4bd205363cdf472ededb311"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-035940-21f1188/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.3/omp-linux-arm64"
      sha256 "c49a84875d915c7d0de8bb69fe180b3bf53c16600bc4d5a61ea22ac2b3ac45c9"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-035940-21f1188/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.3/omp-linux-x64"
      sha256 "8c9a178fed74ec1da21aafb7d28cd9839b3b0c9e7d607c86cc3b6177355729f4"
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
