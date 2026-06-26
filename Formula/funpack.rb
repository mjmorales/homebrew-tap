class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.23.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.0/funpack-v0.23.0-macos-arm64.tar.gz"
      sha256 "dcc7264f297ea900d13d4bc00731fc323327c58e90ae5000d98dca0f8afddc35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.0/funpack-v0.23.0-linux-arm64.tar.gz"
      sha256 "f94ccacfef7037c63d8b4d2ee6e29543e2a2c8f0595823343c36a20ea53db62b"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.23.0/funpack-v0.23.0-linux-x64.tar.gz"
      sha256 "a3788ec90d674bcaca64ad849baa1ecf487e3497c90daeb1f364ec45405fe06e"
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
