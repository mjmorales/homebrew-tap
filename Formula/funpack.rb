class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.10.2"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.2/funpack-v0.10.2-macos-arm64.tar.gz"
      sha256 "c86869a60e4c24444efcb762c87c217b6bd490203775a212aa9acf770b113ff1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.2/funpack-v0.10.2-linux-arm64.tar.gz"
      sha256 "20b3c74f7f82fad4c5f3519df499398c9b1db8c999d7babcb2498ab7ea63012d"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.2/funpack-v0.10.2-linux-x64.tar.gz"
      sha256 "f6622b1afec1c9c404afbebde5def0e9bb5d740fab9b13dcfa3bf0ff84378eda"
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
