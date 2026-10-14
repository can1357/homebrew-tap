class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261014-220229-c2cb79e/omp-darwin-arm64",
          using: :nounzip
      sha256 "85fe6ab9aec55a794d96086021136495f7613d6b1c8f2b08c05840d68233716a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261014-220229-c2cb79e/omp-darwin-x64",
          using: :nounzip
      sha256 "220ee174a5ad09f546f3086beb1cbb9b27b807b9b811cf0dddf5e8cb833de098"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261014-220229-c2cb79e/omp-linux-arm64",
          using: :nounzip
      sha256 "299e0b63c482d78f00f2bae75000815ad6890cb6192cbc9f66c8d98e9ce70b80"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261014-220229-c2cb79e/omp-linux-x64",
          using: :nounzip
      sha256 "c23a58ad8a92f4e738aa12dc904f3b0a1ac7035b953b9bf5d39b71a226179f6f"
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
