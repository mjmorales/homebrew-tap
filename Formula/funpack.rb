class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.13.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.1/funpack-v0.13.1-macos-arm64.tar.gz"
      sha256 "e71148486116b3f9b26cf17331d2eb06f933c1826e3a862127dd6bf70167b63d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.1/funpack-v0.13.1-linux-arm64.tar.gz"
      sha256 "d51c1f38ba162c7b81ee88d357f45c2b7fcb26ab8c95ef5309563ae5774f480d"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.1/funpack-v0.13.1-linux-x64.tar.gz"
      sha256 "e8b61a0a474a1404e05031ba8c95b962b3c248a12c14b0d97c528bfdfd4b1b38"
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
