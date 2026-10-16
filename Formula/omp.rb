class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261016-150632-470b7ef/omp-darwin-arm64",
          using: :nounzip
      sha256 "dfbf52e9ec966e3066e5d8f6df31829dbb4882ca74d82b2fb511b659017f69cc"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261016-150632-470b7ef/omp-darwin-x64",
          using: :nounzip
      sha256 "7536159cd6c54b723cb1ae9daaf58d862008b1f0cdc5036b0b7d4f87b4236f8c"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261016-150632-470b7ef/omp-linux-arm64",
          using: :nounzip
      sha256 "7085f5616a450370af23dbf377302a5e6b731071b1bdea3b34735b334f084761"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261016-150632-470b7ef/omp-linux-x64",
          using: :nounzip
      sha256 "d7d68a2abda24d61870ef2b1943b3fc7bda236d0b98f9eed01b48d8e4d5ffdc7"
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
