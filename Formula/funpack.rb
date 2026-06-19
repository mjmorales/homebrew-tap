class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.11.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.11.0/funpack-v0.11.0-macos-arm64.tar.gz"
      sha256 "738f707b5f627ba5abd99843bfcbfb3a880ddda12dbcffbd304fa00119c3667f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.11.0/funpack-v0.11.0-linux-arm64.tar.gz"
      sha256 "d854e4de62a6e48bbd0da650b030226857c992ef332d516ef7ccc500a4a99f3c"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.11.0/funpack-v0.11.0-linux-x64.tar.gz"
      sha256 "15efeca1924513b648d6963fc76bd1a692cb41c51499979e299908bb6b053d16"
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
