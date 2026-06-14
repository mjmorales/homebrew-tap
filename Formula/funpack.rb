class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.1.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.1.0/funpack-v0.1.0-macos-arm64.tar.gz"
      sha256 "9b6726a4483dd7f9547fd7d46c06ee8515143a71d80e5984df1042b06461ab93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.1.0/funpack-v0.1.0-linux-arm64.tar.gz"
      sha256 "a0704c64d5eeabb2b3f6dda6af469b4b5c9352d45fc348959d7828fef1be4180"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.1.0/funpack-v0.1.0-linux-x64.tar.gz"
      sha256 "4563d9e47865b53b67657a36a965a0fd893b033f220a7080dfa169cad310c445"
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
