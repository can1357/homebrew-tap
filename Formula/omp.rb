class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "18.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://build.stencil.so/d/omp/20261020-194322-1882f58/omp-darwin-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.4/omp-darwin-arm64"
      sha256 "6b3137f1f307733f10565499eaeb747ed2f6acdf2319c8af20ace22939f872e3"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261020-194322-1882f58/omp-darwin-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.4/omp-darwin-x64"
      sha256 "1d487928b38ce4b28208b21d4df1e680581dfc70fa6887173dd0c8230a6f4607"
    end
  end

  on_linux do
    on_arm do
      url "https://build.stencil.so/d/omp/20261020-194322-1882f58/omp-linux-arm64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.4/omp-linux-arm64"
      sha256 "8c2aa64d280067de81bb40b7ca9f35331c0d0133a6562430c151e3bd855a58ec"
    end
    on_intel do
      url "https://build.stencil.so/d/omp/20261020-194322-1882f58/omp-linux-x64",
          using: :nounzip
      mirror "https://github.com/can1357/oh-my-pi/releases/download/v18.12.4/omp-linux-x64"
      sha256 "7cba13c3cf37c3791ac63dfea498fa047408d249a3e39bad37fe882c63bb2792"
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
