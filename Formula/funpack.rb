class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.13.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.0/funpack-v0.13.0-macos-arm64.tar.gz"
      sha256 "8a37b69ff1e9c9ba1521fb946868c92b4653b750ba372d2c31abe4a9d65fa0b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.0/funpack-v0.13.0-linux-arm64.tar.gz"
      sha256 "f0ddc086aad1638c7795256368e3e4f30d6de05a1fcbb05fe08f4ac04d2fa8c3"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.13.0/funpack-v0.13.0-linux-x64.tar.gz"
      sha256 "cb27d72f87136d5a3146bef9776f7dc4d267eb9d5befbed5bdbdcee88cc71330"
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
