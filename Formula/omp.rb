class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261017-231446-291e055/omp-darwin-arm64",
          using: :nounzip
      sha256 "fa41b27d434380e99b713e4f9ced0f73eb1fc0c409fdf23a57c119971d24bac5"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261017-231446-291e055/omp-darwin-x64",
          using: :nounzip
      sha256 "ffafcd5a4fd4a4e91d20fc3a290ba9dfeb7b703c65750ed534d5b0924cf6a0f7"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261017-231446-291e055/omp-linux-arm64",
          using: :nounzip
      sha256 "16545d7e747b31dbc66f2bcd63f24f12dc1dc7e944767b09b0df6591bf826a93"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261017-231446-291e055/omp-linux-x64",
          using: :nounzip
      sha256 "16181401e616d7d895bae31fa97476f1513d4080807d60d3a1a04006191a1bb3"
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
