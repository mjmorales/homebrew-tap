class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.10.3"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.3/funpack-v0.10.3-macos-arm64.tar.gz"
      sha256 "fc3e54a66dc925137f807101ec80bbe8e55217a60a8abc2a0416009154bf15e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.3/funpack-v0.10.3-linux-arm64.tar.gz"
      sha256 "a0ccd63fede4e910c531738f4f1f2fd6a725d2652a24bf7291e666d42dfef271"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.3/funpack-v0.10.3-linux-x64.tar.gz"
      sha256 "6d38e28fde7eadbdbfcc5dfeb9e40bbcb17880daa038131928d41edacea9b1b4"
    end
  end

  def install
    bin.install "funpack"
  end

  test do
    # With no project on disk, funpack prints its command usage to stderr and exits 2.
    assert_match "Available Commands", shell_output("#{bin}/funpack 2>&1", 2)
  end
end
