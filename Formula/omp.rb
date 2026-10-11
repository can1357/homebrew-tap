class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-190749-bd4dffd/omp-darwin-arm64",
          using: :nounzip
      sha256 "f0426c1c71f10aa94d9ac5e5b74e384b1286b2947d3325be8e19fdb0f0e04088"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-190749-bd4dffd/omp-darwin-x64",
          using: :nounzip
      sha256 "d8e224bd6cab142b4ee8136975493fdca80d5641a48b30b5efbcf090e3104ab9"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-190749-bd4dffd/omp-linux-arm64",
          using: :nounzip
      sha256 "5dcd64f584cfebae84315d9e6122997f794b0870d336860b6d99b271ac68ff9f"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-190749-bd4dffd/omp-linux-x64",
          using: :nounzip
      sha256 "647237242329897c3a7c0f3591fdd9cafe4a4e13872baa9bbdfe45b84f9d8992"
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
