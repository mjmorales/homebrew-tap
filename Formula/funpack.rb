class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.22.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.22.0/funpack-v0.22.0-macos-arm64.tar.gz"
      sha256 "d15bdd8ae69bc0686ebfe24bccef8de8aa4df684466e1422adbd35649d042f4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.22.0/funpack-v0.22.0-linux-arm64.tar.gz"
      sha256 "8a8bce3f51c80bd7272ca1c08ddfdc8a14d76c5e92fb27f167792e4eb9cb9535"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.22.0/funpack-v0.22.0-linux-x64.tar.gz"
      sha256 "3ecbadd30dc26111e4e2d94aa8b5c5be038f96b77e1fdf0e7dbed13d11180fd9"
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
