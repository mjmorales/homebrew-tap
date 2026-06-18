class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.10.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.0/funpack-v0.10.0-macos-arm64.tar.gz"
      sha256 "4f0f519fbed23836bc6e0e28f600cb236061c68b230907f993131adb4facdbd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.0/funpack-v0.10.0-linux-arm64.tar.gz"
      sha256 "c776fb0dc029bdad2fa23d8c0e21cf620b7a09742dec2a8eee41089aaeb81ef4"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.0/funpack-v0.10.0-linux-x64.tar.gz"
      sha256 "e44a53ef304b715327ad388504abe1f449f94c1bcebcdf012598a5486ca4e811"
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
