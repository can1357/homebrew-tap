class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.18.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-185830-0920fab/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.4/omp-darwin-arm64"
      sha256 "4739f78f3d88d46221ef6e2874302f33fd974e94edc8825dc575427528a5d126"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-185830-0920fab/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.4/omp-darwin-x64"
      sha256 "6119027d81daa1b7580ae15a905fbe1a5884596ef429558aed1ecef528bbb273"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261109-185830-0920fab/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.4/omp-linux-arm64"
      sha256 "c80739aabdaeb04fd98703631ef95358521c57d0430efeee6156dae1721dc59a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261109-185830-0920fab/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.18.4/omp-linux-x64"
      sha256 "cb5bec642d332c7aca74aafb2165bcc9590dc9d4c9b601bd60c9e56f58319d15"
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
