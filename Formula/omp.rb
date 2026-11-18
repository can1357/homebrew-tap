class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.22.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261118-012042-e1ae2cc/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.2/omp-darwin-arm64"
      sha256 "d02253f9f5e13bafa2af6a6a773cf7531019d37379b073a204b1be128b961458"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261118-012042-e1ae2cc/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.2/omp-darwin-x64"
      sha256 "f534936d69a3e0a75ac48d1a53c078c605f1c5646d25eeba4dbae31a1aeae43b"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261118-012042-e1ae2cc/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.2/omp-linux-arm64"
      sha256 "82a880ba04d73f1c81a12931447f9f9ed8945581998564eae900c1238f4502e2"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261118-012042-e1ae2cc/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.2/omp-linux-x64"
      sha256 "80a692c5adb9c71124bb11e77bd7edb3cf8fbbab6980db3206dcb6a4cb2905b5"
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
