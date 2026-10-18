class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261018-210352-1d5aff9/omp-darwin-arm64",
          using: :nounzip
      sha256 "abd9a5b0fef77f4204078e348e233faa0dd3d5d81719cf2b6a9b9478c10eee48"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261018-210352-1d5aff9/omp-darwin-x64",
          using: :nounzip
      sha256 "dcd3fa827ae73bdb471bb838171ef1c9c5be665a68eaec45ffc6d6e5cf128b92"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261018-210352-1d5aff9/omp-linux-arm64",
          using: :nounzip
      sha256 "967d64fce514586e94c9ac5f978743b4fce29b999c8763747ce4754811407d1a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261018-210352-1d5aff9/omp-linux-x64",
          using: :nounzip
      sha256 "9513ef9f19d7991aac6ae0cb6077bcf16662092ddde861c002a91cedc6f47f9a"
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
