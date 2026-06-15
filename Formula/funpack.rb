class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.8.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.0/funpack-v0.8.0-macos-arm64.tar.gz"
      sha256 "f26cdde501b36c16903221d50a1c70b9a16e6a04414522c0dc7d62e81a3c7f7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.0/funpack-v0.8.0-linux-arm64.tar.gz"
      sha256 "a6a672b5311caa28989b2b5ab9c7cd70a5a7c1fd41623416a99cc001fe18dd5e"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.8.0/funpack-v0.8.0-linux-x64.tar.gz"
      sha256 "2ded7a8c408b46ef7ca563f6a3226dac5bf7331829d6dd7ca1a10f6d5f813f48"
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
