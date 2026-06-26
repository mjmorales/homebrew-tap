class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.24.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.24.0/funpack-v0.24.0-macos-arm64.tar.gz"
      sha256 "b1c571a5d7f9cd09bebb570309ce67718f34a96cbfedddc554492962d6edf496"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.24.0/funpack-v0.24.0-linux-arm64.tar.gz"
      sha256 "804be31455c5a5c29aca559bfad5fd45f1bfc1aae8ab6d47d4137603b9c1f68d"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.24.0/funpack-v0.24.0-linux-x64.tar.gz"
      sha256 "b0e9e879a565307ec50fe62e565fa1c7b594138657b08d4e2ed3bb39955c53b1"
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
