class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261119-000252-57771ae/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.0/omp-darwin-arm64"
      sha256 "a5ee90b2ffcc0c1f031dbd4bedd4ff8e0c884ec8e69b700f4c5d76a1eae89daf"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261119-000252-57771ae/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.0/omp-darwin-x64"
      sha256 "bbb3e9333c31fa5b892ce353dc678e7a67c25667307f5400ea07bd928163fb29"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261119-000252-57771ae/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.0/omp-linux-arm64"
      sha256 "6301041309d9bb26c19576ab116d828dba9c74654507cfa3594d62d310864626"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261119-000252-57771ae/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.0/omp-linux-x64"
      sha256 "c7cc5c8d505053c8ffaf180417e5d5c781235b9d936f286810560151120109bf"
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
