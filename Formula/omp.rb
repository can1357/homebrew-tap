class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261015-150252-7cc9129/omp-darwin-arm64",
          using: :nounzip
      sha256 "bdeb1626b99dc29d844146ea7940d367e61b1032b77e1c77880125f379ca2dda"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261015-150252-7cc9129/omp-darwin-x64",
          using: :nounzip
      sha256 "4ecd91b60a87b7025b691d87b2c1f02cc170b05f02d2473806491b1d7c4f0748"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261015-150252-7cc9129/omp-linux-arm64",
          using: :nounzip
      sha256 "b6e8e13a54d5fa3b374033b35778d9e0d98bb350ad80d03c183983520e9f2db1"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261015-150252-7cc9129/omp-linux-x64",
          using: :nounzip
      sha256 "bf1e86a935b1ea26166a5280001eccea1205e6c21efe1b5853f0fd368c754974"
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
