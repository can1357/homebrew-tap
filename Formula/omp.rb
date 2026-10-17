class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261017-184433-df4f996/omp-darwin-arm64",
          using: :nounzip
      sha256 "27520fa8edc5d9c98b2204a8141f4ab490bfb5ddbf3592e70fc78b3dd0aab1bb"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261017-184433-df4f996/omp-darwin-x64",
          using: :nounzip
      sha256 "975855513aca8f58381b5bf7663c10cae3ae3f90d10fbed84072b0228e87b5cd"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261017-184433-df4f996/omp-linux-arm64",
          using: :nounzip
      sha256 "39565ecc88f7548955f1fadc5d926becb59661a860ae99cf37e4e1ba03df345e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261017-184433-df4f996/omp-linux-x64",
          using: :nounzip
      sha256 "44c921037279d0572390c05a11f3608e76422d96ae77233be10fb1e63e2f487f"
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
