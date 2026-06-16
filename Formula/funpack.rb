class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.8.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.1/funpack-v0.8.1-macos-arm64.tar.gz"
      sha256 "5d7215acc703ce99d2231e9edb073e1b67709d16d780b02c5fc463818baeabe6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.1/funpack-v0.8.1-linux-arm64.tar.gz"
      sha256 "54d3d15aca09fdbc6fd176651da16b9c61afc11e6f9d061356e2d66f5ba9c359"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.1/funpack-v0.8.1-linux-x64.tar.gz"
      sha256 "d70771914cd96dc4809a51b141d3e10bba7484f0974dfa100ff261c8fb3b9756"
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
