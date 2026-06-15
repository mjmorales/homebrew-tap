class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.0"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.0/funpack-mcp-v0.3.0-macos-arm64.tar.gz"
      sha256 "dc63f7c76f8ba6d0502612530f2729b1621ab41ef03ddbb31364d10779cf1668"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.0/funpack-mcp-v0.3.0-linux-arm64.tar.gz"
      sha256 "dc9c9163ede5db9f9e865cb275d59ff5ca12304f415eddcacf35e07211bd6f77"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.0/funpack-mcp-v0.3.0-linux-x64.tar.gz"
      sha256 "c2bad97bc403c598ba38f6c68122bdd1a2ecd332b2785637098aa2c3ddf41f55"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
