class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.4.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.4.0/funpack-v0.4.0-macos-arm64.tar.gz"
      sha256 "83050cca6d41733b9bab0fbda0ce8c5526a5b8ae1688fa6123c2c3998e84b110"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.4.0/funpack-v0.4.0-linux-arm64.tar.gz"
      sha256 "c83fd1df01a05da867a98e9ca4a810f8da61ee5d047997c029a248cb7f45196e"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.4.0/funpack-v0.4.0-linux-x64.tar.gz"
      sha256 "7f71dc46fcd78f0f0f5fa79f9695c3dfb35decc571beb02434d11f64060ae1be"
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
