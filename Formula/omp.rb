class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-215456-3e8cff3/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.0/omp-darwin-arm64"
      sha256 "d185113d63eba23925e5d70ab661a424b827c06c98f8e766c3bf4ad62ddaff9a"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-215456-3e8cff3/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.0/omp-darwin-x64"
      sha256 "a1933196fe54bac3d518ccf7e5cc11849dd207b710cda431c465a12d173ff035"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261116-215456-3e8cff3/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.0/omp-linux-arm64"
      sha256 "7238dd213d5c61bc9bf51735d552bc71901fdd44329f862b0a971146b1cdac3e"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261116-215456-3e8cff3/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.22.0/omp-linux-x64"
      sha256 "f706b27ba845834d8f8360705a2e9ba1534f3593fa24411d41358272de33642b"
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
