class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.6.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.0/funpack-v0.6.0-macos-arm64.tar.gz"
      sha256 "5db534a7268a514c0c7bbd391e4a438581b7955fa11d24e1e560ab3ba02f5ba3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.0/funpack-v0.6.0-linux-arm64.tar.gz"
      sha256 "a88773bcc394d30adb5b51b76feae000c5fe4211ad8c89235dc908a16b8a79b5"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.0/funpack-v0.6.0-linux-x64.tar.gz"
      sha256 "273374ea25cbe93e11ad062bcedfb59942b9e68a2b9a2aa2e565838b5fcf02b4"
    end
  end

  def install
    bin.install "funpack"
    bin.install "funpack-live"
  end

  test do
    # With no project on disk, funpack prints its usage banner to stderr and exits 2.
    assert_match "usage: funpack", shell_output("#{bin}/funpack 2>&1", 2)
    assert_path_exists bin/"funpack-live"
  end
end
