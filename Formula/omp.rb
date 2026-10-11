class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-111043-a4d6f0a/omp-darwin-arm64",
          using: :nounzip
      sha256 "399d40fd79889070363952495dde6abdb0fd2770b046e08595808ce6c7980fbc"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-111043-a4d6f0a/omp-darwin-x64",
          using: :nounzip
      sha256 "112deaf080a13e420f4919173d11d99c03fbbd27cddf17783dde3a17ea704bef"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261011-111043-a4d6f0a/omp-linux-arm64",
          using: :nounzip
      sha256 "8d67b1d1c8e698a8fa568685cab72b05a13263b45192e334fb5e1d04bb7dde83"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261011-111043-a4d6f0a/omp-linux-x64",
          using: :nounzip
      sha256 "0ac24a7c146dbfb4005ef00e21aa60bf9b1ddf15dae5f92938542c1475824417"
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
