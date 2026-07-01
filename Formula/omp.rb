class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "16.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "220e4694386b1c84758330550e7ce41712bb9ee565be55f2243c140c2e4f5b30"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64",
          using: :nounzip
      sha256 "a7f7f0bb0b950c2c32a3bd1a725e9059bb8ebd7109ef3ead72df61b7c7f6706a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "f8a7e52c58a398473446626536a5f8e7bf6bb65072351f977539458c54e1da9e"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "387eb20fa29a7f526f93a51ec984e56a0b45b46774499c81aa286029e815f398"
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
