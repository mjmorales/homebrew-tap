class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.2.0"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.0/funpack-mcp-v0.2.0-macos-arm64.tar.gz"
      sha256 "87a1f73dd0e3f8149b9a8295a8d41993c8d0a7e11cb7695dd6d0306a52976841"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.0/funpack-mcp-v0.2.0-linux-arm64.tar.gz"
      sha256 "f5c20eb3e954bdf4efecb7d16dd7062dbaa6dfce5ef6ea33977f19d5cf9adb03"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.0/funpack-mcp-v0.2.0-linux-x64.tar.gz"
      sha256 "5327e20baf12e9dc3f439eea70c009bfd0499c31fd7476d0a88dc5b85f8cb763"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
