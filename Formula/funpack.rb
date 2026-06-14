class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.2.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack-live (the runtime) links SDL2 at runtime; the funpack compiler is headless.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.2.0/funpack-v0.2.0-macos-arm64.tar.gz"
      sha256 "2a45e4a51f01870f4b07bda44f51303bed9ac78e826b3b1529ad8df4d615aee1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.2.0/funpack-v0.2.0-linux-arm64.tar.gz"
      sha256 "60f40ae68899b8c0677c5b8b05b969b18da499f962469a7bb58c2a7c85603b17"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.2.0/funpack-v0.2.0-linux-x64.tar.gz"
      sha256 "c7a46d539f06737faa08099f8e77eb545837a22c2a16f841bd0a547a498b10d5"
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
