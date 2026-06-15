class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.6.2"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.2/funpack-v0.6.2-macos-arm64.tar.gz"
      sha256 "480f159c08caccd3dcc5db23bfe30b95865daa182807c8c1e800cdb0353908aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.2/funpack-v0.6.2-linux-arm64.tar.gz"
      sha256 "07fddd2e5598f6fe32d8b6dc3a3bbbe69a9ea5b32fda8c7180ed0278ad50904b"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.2/funpack-v0.6.2-linux-x64.tar.gz"
      sha256 "863a80004d3cbe69aaf8139f6f8babc3f5e5781a65b81362f33595c60688bf64"
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
