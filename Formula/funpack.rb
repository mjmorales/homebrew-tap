class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.21.1"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.21.1/funpack-v0.21.1-macos-arm64.tar.gz"
      sha256 "17621b93b43f4bfb626f9ae8b63cb5c7bee252fedccaf43c3ef1982bafb2c462"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.21.1/funpack-v0.21.1-linux-arm64.tar.gz"
      sha256 "a20ea75a6f0807796d964ddda33509695314aea53240e3ab9e5be2a8864161ad"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.21.1/funpack-v0.21.1-linux-x64.tar.gz"
      sha256 "87d9c6b8b4f3837908ffea857d45a74d86a58fee893f826984a4ae04542263db"
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
