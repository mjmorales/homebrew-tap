class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.30.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.30.0/funpack-v0.30.0-macos-arm64.tar.gz"
      sha256 "3f9ef985d39960279d8e78b53f3a0580fab4eee83894d0e758bc617832749c66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.30.0/funpack-v0.30.0-linux-arm64.tar.gz"
      sha256 "26b76514e62dd4a8e59d4a4e98694228faa7bb01cbc0601cfb112f9e1f41e37e"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.30.0/funpack-v0.30.0-linux-x64.tar.gz"
      sha256 "ad21f2e661014a1a7f9ce518426dd8ff9e4f4fdf4848089a936f96d73dc516c5"
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
