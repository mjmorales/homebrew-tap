class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.26.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.26.1/funpack-v0.26.1-macos-arm64.tar.gz"
      sha256 "540218b35c11a2a425b8e22955d8d9ce505c99e6388c2d1527450de1cffb771b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.26.1/funpack-v0.26.1-linux-arm64.tar.gz"
      sha256 "6f6eb5987e614ea250cafb39413b6219cb3ef62a052228ad6a430ec280363a84"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.26.1/funpack-v0.26.1-linux-x64.tar.gz"
      sha256 "af4172748f2453aa305cc91574d968ce51187543940d92cb2878113e2a906a28"
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
