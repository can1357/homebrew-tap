class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261031-175633-7efd772/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.2/omp-darwin-arm64"
      sha256 "9b7bda0bd8ec8d1fd8f8deda076180deef2d4921ee60e7d2f39044ee7d9437ee"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261031-175633-7efd772/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.2/omp-darwin-x64"
      sha256 "62835e51acc0f07d19493da736b7215d3224fd5099754b7e42c3b0fdc2eb7f45"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261031-175633-7efd772/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.2/omp-linux-arm64"
      sha256 "afbdf04be3ddbe34a07e91c913ddb6d335a3a0210f520ac5a197a245888ad63e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261031-175633-7efd772/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.14.2/omp-linux-x64"
      sha256 "cde0bc4ac8ec333c4880039a5242ff33dbfc6544747d67aeb99bb077874aeec1"
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
