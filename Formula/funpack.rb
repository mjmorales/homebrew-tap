class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.17.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.17.0/funpack-v0.17.0-macos-arm64.tar.gz"
      sha256 "a526f69afed037d42e4128e156315faf77754adb2dae7f293fe3f603822292a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.17.0/funpack-v0.17.0-linux-arm64.tar.gz"
      sha256 "946e8c954992dab07f01205636b84d1cf8b1beaa327ac7d295eb9b976229cedc"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.17.0/funpack-v0.17.0-linux-x64.tar.gz"
      sha256 "4ab884ad6dc3cf0c0f7889a8c6538e3996380f498cac8afd7954f58f7a0a9fe7"
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
