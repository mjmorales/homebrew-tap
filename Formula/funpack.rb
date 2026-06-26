class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.25.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.25.0/funpack-v0.25.0-macos-arm64.tar.gz"
      sha256 "5efb6adb77c4caa0026590cb91529aab8b5c9d60d0b475a3077e0cfcb06d7a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.25.0/funpack-v0.25.0-linux-arm64.tar.gz"
      sha256 "dfb8aaf02eae5458a060041944a3acff772fa89969e9d101350ad6514f373b45"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.25.0/funpack-v0.25.0-linux-x64.tar.gz"
      sha256 "e191cd459ea0513dcde644ce29253d51032aa26aa203279e2dabdbe85b143126"
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
