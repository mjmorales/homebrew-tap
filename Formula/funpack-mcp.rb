class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.1"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.1/funpack-mcp-v0.3.1-macos-arm64.tar.gz"
      sha256 "5999cfa6f29dd8b0cc48e9ff72655d6931d31ca2ecd3d11a90a2e8e2be3fa356"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.1/funpack-mcp-v0.3.1-linux-arm64.tar.gz"
      sha256 "424fcf3d5dd8398b198ab32a1e120886ad13a40eab2320cfa39d847ad93c4f0f"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.1/funpack-mcp-v0.3.1-linux-x64.tar.gz"
      sha256 "8165ef000fbb8fc680e245d31c795c13426b7694a7f57e43ec0478311e9e5f00"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
