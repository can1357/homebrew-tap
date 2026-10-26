class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261026-202953-011ab73/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.0/omp-darwin-arm64"
      sha256 "524edc3f12b97fbb069bc4d396dd5d711d18ba03db6f60c1f1309d06db9020e4"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261026-202953-011ab73/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.0/omp-darwin-x64"
      sha256 "21c0a2f3b974a526754b35084256e1b62213a1347e12885bc4735552d0451144"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261026-202953-011ab73/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.0/omp-linux-arm64"
      sha256 "419186e8c52dd5cbedd3bc3647d68803d6f5c515a61849957493391f8e008ef1"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261026-202953-011ab73/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.13.0/omp-linux-x64"
      sha256 "786f5f7652079d972247e3112baaa828ec87aae7c4c3ead20e997b7b4c99d95f"
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
