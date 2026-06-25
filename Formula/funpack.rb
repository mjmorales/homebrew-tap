class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.20.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.0/funpack-v0.20.0-macos-arm64.tar.gz"
      sha256 "948e80b32532922bb948b9d26a5f6bd9ae8b93edd752c61692b87cf96822a315"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.0/funpack-v0.20.0-linux-arm64.tar.gz"
      sha256 "019f8a3230c66d7bdc07483e914d4c6d00c8cbb22d5acd198b83670b4bf0d851"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.20.0/funpack-v0.20.0-linux-x64.tar.gz"
      sha256 "1c36b79e2c5eaf3c8d53406f1cfbfd469b60f21a65f8f93e87478c3b0abb02f4"
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
