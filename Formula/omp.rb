class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261102-194957-650f3a1/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.16.0/omp-darwin-arm64"
      sha256 "d4a10d97488d6054d2b18198bd24f461079952c7e0fb75ba66336ca0df0cb99e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261102-194957-650f3a1/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.16.0/omp-darwin-x64"
      sha256 "abd62d315b66314f0f635d537407037e7b0d06782513d8035669db5ef744242d"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261102-194957-650f3a1/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.16.0/omp-linux-arm64"
      sha256 "c2be1ea85ce17c4270854b57efff2a7ea1d5a03c7557fd08721f2b9bb32698de"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261102-194957-650f3a1/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.16.0/omp-linux-x64"
      sha256 "6498ed785bab00d2926e0387e0ec02362d6d45f1c3d0d1b57c1618b7f95c9264"
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
