class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.29.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.0/funpack-v0.29.0-macos-arm64.tar.gz"
      sha256 "f80b9a54f3edefbe2ee6781ac5b3ae23040d8e48b19e7412446d865f144a7832"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.0/funpack-v0.29.0-linux-arm64.tar.gz"
      sha256 "1cbf9c7478ba74541ce1d58ce6040a4d378c164240575dcdc15509b22e1edfe7"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.0/funpack-v0.29.0-linux-x64.tar.gz"
      sha256 "f3d65eee963067f256a69d7a3bf119a840905c9ac5b1bd794180657ecd112564"
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
