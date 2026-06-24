class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.16.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.16.0/funpack-v0.16.0-macos-arm64.tar.gz"
      sha256 "d7b90cf3e82b91eb7838fd918712b582e7fe210b0ef840531b2894d3c6067593"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.16.0/funpack-v0.16.0-linux-arm64.tar.gz"
      sha256 "31c1e666dd5fc91a1163977827efe7c53b38e0230c84e8b16a573a4c0bd03d9d"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.16.0/funpack-v0.16.0-linux-x64.tar.gz"
      sha256 "0d018299f2f0f88aa2f654e4371eb9edd399605cbd02ce281d93b22fa03b8182"
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
