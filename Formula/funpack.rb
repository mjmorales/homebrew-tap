class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.3.0/funpack-v0.3.0-macos-arm64.tar.gz"
      sha256 "bed59e2261a3b9ab7df78dbf6f00e1563ad36261150d0fd40983b0c5f9d82575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.3.0/funpack-v0.3.0-linux-arm64.tar.gz"
      sha256 "065455534f5dcd2fda32579e4cf9b6c3816b1e9780cd57b9a605954b9b2da663"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.3.0/funpack-v0.3.0-linux-x64.tar.gz"
      sha256 "e877608dd128b4ac66b2c8930c6328a9147a8b49a0c083729ae50f91cb2e333a"
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
