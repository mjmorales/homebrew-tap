class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.2"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.2/funpack-mcp-v0.3.2-macos-arm64.tar.gz"
      sha256 "2d17638b62ee7028be358cfa67970a0d0c7e53d958eab4b3b1677407ae46863d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.2/funpack-mcp-v0.3.2-linux-arm64.tar.gz"
      sha256 "e068c97fdb72fe65c989e4accca2e1a644635cdcbeca55145e42590ef1ba2e7f"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.2/funpack-mcp-v0.3.2-linux-x64.tar.gz"
      sha256 "8e90126a93f45501cb96e3224152610cb14e4d5c06facd8d41b4b5c31518f472"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
