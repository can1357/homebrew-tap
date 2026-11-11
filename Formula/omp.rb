class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261111-033204-679691a/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.8/omp-darwin-arm64"
      sha256 "8de03d5f3ef3b37470cacc12539a547ace0152da562ee74a43099ec963a129eb"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261111-033204-679691a/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.8/omp-darwin-x64"
      sha256 "b332fab3698384da504c449c5da365d2b631305a8412161a63a1d9dd769ddac2"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261111-033204-679691a/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.8/omp-linux-arm64"
      sha256 "5e4de8d03d543414115480e03d6d232a43cacf25dcb9df8d8f93a44a8a0e7667"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261111-033204-679691a/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.8/omp-linux-x64"
      sha256 "bfb7a85cceade6e5580fad59ff87570b4de50039b0428ed30339cf4286bd052f"
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
