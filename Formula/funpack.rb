class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.19.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.19.0/funpack-v0.19.0-macos-arm64.tar.gz"
      sha256 "1d68e4af21908558a70289b72fd5a83a6fbb4a4c67c3f6f54409a6cd437259d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.19.0/funpack-v0.19.0-linux-arm64.tar.gz"
      sha256 "17822e9b3b7c81f42b679649d15fb1ff6bb13cbc299544fdafbdbd8790a1eeba"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.19.0/funpack-v0.19.0-linux-x64.tar.gz"
      sha256 "26893f70a0a3cf5e7510e4801ef0852751bf5e4b21fab86dba6d384e47d932bc"
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
