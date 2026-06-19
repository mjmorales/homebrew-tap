class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.10.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.1/funpack-v0.10.1-macos-arm64.tar.gz"
      sha256 "49e4a4f86e5a6b3e15aeac319b4cbb62cce5b15e617f33dff4d9395d4988b79d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.1/funpack-v0.10.1-linux-arm64.tar.gz"
      sha256 "060775b7bcc13b16409cbf8252b8ff55254b993c28f2589cf22a076a9324940c"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.10.1/funpack-v0.10.1-linux-x64.tar.gz"
      sha256 "7dabf89cac81af64719d30dee08bfd1fc571f8bfd0350153ec2b60ae74b92b0d"
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
