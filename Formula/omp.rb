class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-171106-b55cd1b/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.1/omp-darwin-arm64"
      sha256 "43943119837612b2da72250ab7efe22ff8ca239eabebd4f702f34e3a144fdd3d"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-171106-b55cd1b/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.1/omp-darwin-x64"
      sha256 "4face26750f5679857a606a61df22b1587925d4b308d5938de470d8c780cd871"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261125-171106-b55cd1b/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.1/omp-linux-arm64"
      sha256 "92d4cce4b14814f6b838aa86dcec6359f0cb089cbcc300e8463cbb5326991fe0"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261125-171106-b55cd1b/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.2.1/omp-linux-x64"
      sha256 "e8b937f9bf023baa147bdd300ad5421af0a6ef8b1f350c47a9a93d5fca94feca"
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
