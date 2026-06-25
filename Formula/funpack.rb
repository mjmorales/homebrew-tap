class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.18.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.0/funpack-v0.18.0-macos-arm64.tar.gz"
      sha256 "725ee4b706b3113eb851ae8299c84e1bc000e1e1fb145c79868451c7b31ba4c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.0/funpack-v0.18.0-linux-arm64.tar.gz"
      sha256 "dcd7ff969d339c4b1ee1903f2c284c85097f45ce8278f1412d80317a383de1dc"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.18.0/funpack-v0.18.0-linux-x64.tar.gz"
      sha256 "2ae13285a0ec916346d2bc8506d05c5a010f483b7d379513be58fce876eedb80"
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
