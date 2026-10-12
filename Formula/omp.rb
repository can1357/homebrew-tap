class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-140905-c891346/omp-darwin-arm64",
          using: :nounzip
      sha256 "9752e3d7f7bdab636e21495a6affc196e8ffc3a2dffaf529db2dd73d2bdea255"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-140905-c891346/omp-darwin-x64",
          using: :nounzip
      sha256 "76b0d22a95f3b8a8f4023ed0940ba7f262f1032b61c15dd65c4f6c20776ad5cb"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261012-140905-c891346/omp-linux-arm64",
          using: :nounzip
      sha256 "a3ca5d7c4bf09c0d0cd1bc6bdeb77b59b3c33d4fb13240f05d272d46ec0c6a0e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261012-140905-c891346/omp-linux-x64",
          using: :nounzip
      sha256 "3d8f967bb4cf2a154592115edaf4bb723d7a6a6448eec933ac5eb49344938125"
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
