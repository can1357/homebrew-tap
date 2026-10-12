class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-055547-5d0aaff/omp-darwin-arm64",
          using: :nounzip
      sha256 "74d920b72e7af01dbe258b41bb0684da7e747af63628eee41e98b5e74e2f21ac"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-055547-5d0aaff/omp-darwin-x64",
          using: :nounzip
      sha256 "057b47eb1b3d57c0af9d89c3b144be455d2064e9febdc85bec8a38191302e1d6"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-055547-5d0aaff/omp-linux-arm64",
          using: :nounzip
      sha256 "5cad38a8edee60cec9c0ce91810eba38bda0efe349562157023810343dacb8d5"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-055547-5d0aaff/omp-linux-x64",
          using: :nounzip
      sha256 "9798d22d518b23342b4cadf57672b276ef09e756c1832adc6571b04b26ad4f1b"
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
