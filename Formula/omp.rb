class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "19.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261119-225504-f40f335/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.1/omp-darwin-arm64"
      sha256 "2fe420bbd00f81899816e51cbeeb9593afa59d9368d62c9d3e78535d540e32f6"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261119-225504-f40f335/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.1/omp-darwin-x64"
      sha256 "8d62502eede8c7a43311798434d0a31a1c024a3abc56bedc4da200cccf94fea1"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261119-225504-f40f335/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.1/omp-linux-arm64"
      sha256 "237ede0f4994d61f523802c4cf562d4e48bae74c188add792d06d051b907cecf"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261119-225504-f40f335/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v19.0.1/omp-linux-x64"
      sha256 "6ceef04430851bb1050c6fda3af467412eb44a11df0a6ff8121fe601013c5415"
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
