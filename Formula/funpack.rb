class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.14.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.14.0/funpack-v0.14.0-macos-arm64.tar.gz"
      sha256 "596b787a066edc1817fd87149fdde55f587a285d5c3f244497e3fd1780aa63b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.14.0/funpack-v0.14.0-linux-arm64.tar.gz"
      sha256 "611ededae519d17d934570fe7616bf2a4a1b56a073e75a2e6f2155b8ec456d1e"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.14.0/funpack-v0.14.0-linux-x64.tar.gz"
      sha256 "d924a4625dedb9e4170f1269579718c684d4830d98b33b5d17d260d367cc6b96"
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
