class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261027-180828-e996e1c/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.2/omp-darwin-arm64"
      sha256 "38c3645283ceba06f66462830ae15f27270cc7f84575e40a4c6bd68452a63d0f"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261027-180828-e996e1c/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.2/omp-darwin-x64"
      sha256 "a5b85a584f29c9abf4da8d2b3f9e4763645d55d2bdd6ff1f2d3b45500892f069"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261027-180828-e996e1c/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.2/omp-linux-arm64"
      sha256 "5a5f3d468a4e77b5570b516a96506046c168ec64922eda1dc4fc8db727d208d3"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261027-180828-e996e1c/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.2/omp-linux-x64"
      sha256 "dc499ea63082181a4734e5a197d61f04394e7cc0191ef7ba192d110abca0d6c4"
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
