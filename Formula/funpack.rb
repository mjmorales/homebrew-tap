class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.18.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.1/funpack-v0.18.1-macos-arm64.tar.gz"
      sha256 "9aec5012c9c163500f203b92aa17c76ffeecbac6bad8c54e070823172b643005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.1/funpack-v0.18.1-linux-arm64.tar.gz"
      sha256 "5da6c28111baea0c48d87a92fa19f3d486d97e9bd72137b0d4e241d92a409f1d"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.1/funpack-v0.18.1-linux-x64.tar.gz"
      sha256 "3f617996f5d001967f0ae857cdab905fe327e54f6bf67cd0034fccf1ca60736b"
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
