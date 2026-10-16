class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261016-214603-96894a6/omp-darwin-arm64",
          using: :nounzip
      sha256 "d518310d647d467a2c5c3f2d38e34489a761996d766395c03b37c61a2203d02b"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261016-214603-96894a6/omp-darwin-x64",
          using: :nounzip
      sha256 "42f51af9b9d015a4c422283b803378fceca9a6b0516809797485ade298d07b3a"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261016-214603-96894a6/omp-linux-arm64",
          using: :nounzip
      sha256 "c39cf4ab3633a7003a37c619744838125a99208d36ca748e59c4e62815170cba"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261016-214603-96894a6/omp-linux-x64",
          using: :nounzip
      sha256 "01fbb5f08b0ce0d70bd0b1d6655a6ccd59cefcae0f1023e02bb30f9a70bc2d0a"
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
