class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261101-141740-3fedf8d/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.15.0/omp-darwin-arm64"
      sha256 "d36dfabf0ee52d6f08efadb59c46f0349545c6f6975522417adae29646e73e34"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261101-141740-3fedf8d/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.15.0/omp-darwin-x64"
      sha256 "dc86c67ff66418403dcf62a62bf8129fae8f24e50a1b4099716c8d36914fe204"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261101-141740-3fedf8d/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.15.0/omp-linux-arm64"
      sha256 "6d7d65030ba562d73cb0687b9710e0ac597b362a185d1911e7b211706dadd4ac"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261101-141740-3fedf8d/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.15.0/omp-linux-x64"
      sha256 "6737ee2415555a3656cc7b89c14d1c25c18658ee4c0fd4f7309705149ccb7b0f"
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
