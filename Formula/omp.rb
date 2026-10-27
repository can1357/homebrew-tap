class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261027-005706-0838d2a/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.1/omp-darwin-arm64"
      sha256 "f9c66e8725cf132a6de31b2321908ae1c43c668de12c91deaf368d25c01947d8"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261027-005706-0838d2a/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.1/omp-darwin-x64"
      sha256 "96de0e3b42231f0e5b00333005f413dd97a76160da0d54df299eb0302e0522f7"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261027-005706-0838d2a/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.1/omp-linux-arm64"
      sha256 "803db725f9e5bd177ce5274f7718081481f367829f773d984a0a9611f4713244"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261027-005706-0838d2a/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.1/omp-linux-x64"
      sha256 "ee2961c7da02e514a2475ee958c2fd85dbabf4d0907949ba5022edb2951f84b5"
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
