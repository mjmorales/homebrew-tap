class Funpack < Formula
  desc "Compiler and runtime for funpack, an LL(1) agent-first game-dev language"
  homepage "https://github.com/mjmorales/funpack"
  version "0.28.0"
  # Upstream ships no LICENSE file yet; `license` intentionally omitted.

  # funpack is one binary (compiler + runtime); it links SDL2 at runtime.
  depends_on "sdl2"

  on_macos do
    # Apple Silicon only — funpack publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.28.0/funpack-v0.28.0-macos-arm64.tar.gz"
      sha256 "d8f009fa01adaa8c37924a2e42624dbf09739f8df1bcfcae0e684b5e829b4009"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/v0.28.0/funpack-v0.28.0-linux-arm64.tar.gz"
      sha256 "42a873ce72eb75122e881bd20061d3fcddab9fcbcf85efd216dbe7e4daab1a2a"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/v0.28.0/funpack-v0.28.0-linux-x64.tar.gz"
      sha256 "497607607322cbce9492750ea997a1119643b3fc6fd0808aa1974fe8a2dbb050"
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
