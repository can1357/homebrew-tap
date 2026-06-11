class Omp < Formula
  desc "Coding agent with the IDE wired in"
  homepage "https://omp.sh"
  version "15.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-arm64"
      sha256 "c54604a8aae1ed14a9940b107fc1eec303e5c34ad1ee2ffb3d353020c809ab30"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-darwin-x64"
      sha256 "3ac859d1c5e0609fdbd07fac4ceb3103e16e52093833b0d4269b445756cacc2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-arm64"
      sha256 "dc0a109ccc24e94ef92606052636773f68f2f62eb319aac407cb6deb766a19ee"
    end
    on_intel do
      url "https://github.com/can1357/oh-my-pi/releases/download/v#{version}/omp-linux-x64"
      sha256 "144ea7082611ee11fcf655e73d2d70f0afaa23ca3487b0aea836e2096f80835c"
    end
  end

  def install
    bin.install Dir["omp-*"].first => "omp"
    (bin/"omp").chmod 0555
    generate_completions_from_executable(bin/"omp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omp --version")
  end
end
