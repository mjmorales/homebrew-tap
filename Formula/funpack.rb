class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.27.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.27.0/funpack-v0.27.0-macos-arm64.tar.gz"
      sha256 "c1939edd8d5ee9eb85e8b91706d3940ede81f65abc16eef423cf0e23d523af8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.27.0/funpack-v0.27.0-linux-arm64.tar.gz"
      sha256 "8f167bb973d48e01f65bda34e30592085b598be921f9160a87122f69b2bd2b64"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.27.0/funpack-v0.27.0-linux-x64.tar.gz"
      sha256 "c1eedbbe32166d009e624f6f327a04e07bcf525b5c7eddff754d20aacd74a780"
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
