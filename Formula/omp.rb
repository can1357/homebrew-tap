class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "17.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64",
          using: :nounzip
      sha256 "0a9052e6a2a53bf40477c0628da0cc58c36910832de2a2aa87470f79432e2a3e"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64",
          using: :nounzip
      sha256 "ceecdee22a7a15a71893dadbb62cc4399e301c3a8c2d5f2e11f693cb3c05eb2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64",
          using: :nounzip
      sha256 "564ce4c95d06491ac6936d3a6807f811f288ac75afcb6a849ef1b041ad780857"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64",
          using: :nounzip
      sha256 "6b60d9c3f9092316e06146bde0e73686935db0726824e90fd06b77ed13849afe"
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
