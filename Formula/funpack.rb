class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.29.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.1/funpack-v0.29.1-macos-arm64.tar.gz"
      sha256 "107ecd323c2447bb81bee400f1a19a022fb3229f6057e7ed4522329fd57a85cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.1/funpack-v0.29.1-linux-arm64.tar.gz"
      sha256 "9def88d82780c3c6815c5b896f945d4f0958d9b75ae1829ff9057c5dd5534e54"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.29.1/funpack-v0.29.1-linux-x64.tar.gz"
      sha256 "1295a8ab38d762fbf9821163281d7febb505c1095655539c8d672db093433bd2"
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
