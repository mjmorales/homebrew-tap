class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.6.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.1/funpack-v0.6.1-macos-arm64.tar.gz"
      sha256 "e83b0891f3f9415d13935414838ff8900054fe3d046a042db92053039fa7fdcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.1/funpack-v0.6.1-linux-arm64.tar.gz"
      sha256 "326b375746f6085c8b38a489de271d013e7c273e7c928b9be760046fbd1964ef"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.6.1/funpack-v0.6.1-linux-x64.tar.gz"
      sha256 "77340a1e8e0870b1a668ef3a9e0d0b8acafe7009bdda2c6dc3437fa8b6adce10"
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
