class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-192420-81e1d89/omp-darwin-arm64",
          using: :nounzip
      sha256 "985c70cbcd264f6c6313de45ee81df6734664ec8ed8e72fa39fc644df625f0ce"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-192420-81e1d89/omp-darwin-x64",
          using: :nounzip
      sha256 "f19f9a7b4c715456f778ab3ae28fbc38978c6bae6296a832506bc7225f343942"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-192420-81e1d89/omp-linux-arm64",
          using: :nounzip
      sha256 "7f580e1fe06ebffe16ae46cc6881051aca4980db7f654702feefed5651555862"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-192420-81e1d89/omp-linux-x64",
          using: :nounzip
      sha256 "366ffcda80db57b825921b6ff4b0e5e623bc62cf18478f2828cd8a322fc72ff9"
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
