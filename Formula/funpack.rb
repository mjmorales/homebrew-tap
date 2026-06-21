class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.12.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.1/funpack-v0.12.1-macos-arm64.tar.gz"
      sha256 "1e57b450ecc05cd08f7ce9cb4c82d87b65ed21d85b8404e522d81712c1041810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.1/funpack-v0.12.1-linux-arm64.tar.gz"
      sha256 "0127889fad92417ad9e006c950b667e59cd7b269813ff14471e2fcf5df7e4e9e"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.1/funpack-v0.12.1-linux-x64.tar.gz"
      sha256 "a2cb6216d6164ee4ac704c125b6f39fa9ab1a4499a089172525068f847a8e72f"
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
