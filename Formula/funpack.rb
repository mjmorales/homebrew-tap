class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.5.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.5.0/funpack-v0.5.0-macos-arm64.tar.gz"
      sha256 "10cc5cf489af1c1bf5dbdbfe82c31c9bf96fbb11a2ca88c5832d3f0e3cc0fd4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.5.0/funpack-v0.5.0-linux-arm64.tar.gz"
      sha256 "0fe7e6b09b85172e88fc7bc57ddc1c58cd0106fe7a3293464dce6cb0bfbbb587"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.5.0/funpack-v0.5.0-linux-x64.tar.gz"
      sha256 "b18389fcb9e4eea7d445fe76cc431077d579bd2dc4d38895193855e4ccd8f2a9"
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
