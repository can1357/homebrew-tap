class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261111-190638-50da2d3/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.9/omp-darwin-arm64"
      sha256 "493060f672eb152d85afeb51451b62b4acbd68b8c4071c96e9e3226e15a7251c"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261111-190638-50da2d3/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.9/omp-darwin-x64"
      sha256 "3360b445d8a4ff9632b09839eed997e502233468e868feba3a7eeb73242b00b9"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261111-190638-50da2d3/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.9/omp-linux-arm64"
      sha256 "81c978db22a0c1fc27e49d99196dd4979ff7604151f4b0924d5581733622f86b"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261111-190638-50da2d3/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.9/omp-linux-x64"
      sha256 "942a0c59a13a2eccffceab551e73ca9a5a148d69ae6320b7bfa1a7a130aafad3"
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
