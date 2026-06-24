class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.15.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.15.0/funpack-v0.15.0-macos-arm64.tar.gz"
      sha256 "8fb651f75c6d3f67748628121cdf860059779f5f0a9cea408cba9cebe9973af0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.15.0/funpack-v0.15.0-linux-arm64.tar.gz"
      sha256 "a9ea6c69258964b6ceeefee5ee2ad702c5982c26386203ebdbe8d0f3cc099ad8"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.15.0/funpack-v0.15.0-linux-x64.tar.gz"
      sha256 "78df3f8ac1221478b8cc025ec4a985872c0b6597772af27760b0d1d22bc11901"
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
