class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.23.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.1/funpack-v0.23.1-macos-arm64.tar.gz"
      sha256 "e33effa65379667c868e51e2b6d1224a67b7778fedab01a3104e9f8a8de059b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.1/funpack-v0.23.1-linux-arm64.tar.gz"
      sha256 "5eca45e6e87e3f3b5862e84fc8222cb0283d4645d4ef167df6fb886b7724051c"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.1/funpack-v0.23.1-linux-x64.tar.gz"
      sha256 "0248dcf81242f6ccc5ddf46c6a8282e12aec1800b18cae90e0ff2950d9636eac"
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
