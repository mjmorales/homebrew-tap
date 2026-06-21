class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.12.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.0/funpack-v0.12.0-macos-arm64.tar.gz"
      sha256 "599178470d0d0489fa3b1a72cf0b7305122062b7b15aabd22a2f6a5d5f7cd6fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.0/funpack-v0.12.0-linux-arm64.tar.gz"
      sha256 "3f9053c6fa788430ff5bac37d5de5efb2979eb7235d68fb96df88c0fa00422a3"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.12.0/funpack-v0.12.0-linux-x64.tar.gz"
      sha256 "af755c7a60767ef2a3b720c2b5e3268905e46e828d4aeb84fc443fa5369a0365"
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
