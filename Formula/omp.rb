class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "16.1.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "2a1d8d21554b20a905a4e36388385477b92e6e2cf62f74ad8f15bbff476f27c3"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64",
          using: :nounzip
      sha256 "637e5fc82d33728fe7b02c1e6bd8a9ca1a7286c7ebd8403331ecd81de80e41b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "34708f93cd79eaabc8e87b38d821d7b277bf1b70efdf82e2182b632d58a4d098"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "783e92701c19fc09117c6eee09b8f9db685f40c81319372b230af509c001458f"
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
