class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.4.0"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.4.0/funpack-mcp-v0.4.0-macos-arm64.tar.gz"
      sha256 "39ee47f310269c63f1b619ff6b8524c3d4ed914df414b40b8a2e6978616d68c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.4.0/funpack-mcp-v0.4.0-linux-arm64.tar.gz"
      sha256 "920c978e3515c8531b351c4eddaf81ffd2933f015a1ce712a4c67336a7617739"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.4.0/funpack-mcp-v0.4.0-linux-x64.tar.gz"
      sha256 "5102c2bacf11d1fbe987d3dfee17de471af926e7300d84accfe4ca6b6f39e5e6"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
