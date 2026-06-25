class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.20.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.1/funpack-v0.20.1-macos-arm64.tar.gz"
      sha256 "a33a8ef85893640a73445ae4dbd9d41f6d7c3a640017743eeaea0712e3d8b7f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.1/funpack-v0.20.1-linux-arm64.tar.gz"
      sha256 "351df02fee1a612f0d746a9f8ce5ecb03dd8ba3e4bb94945dd1f20dc8c9a39a3"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.1/funpack-v0.20.1-linux-x64.tar.gz"
      sha256 "a80ba037b6eca9b1f7e111aeb3e57d291cc745199bb44700c966bbc2059c7f80"
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
