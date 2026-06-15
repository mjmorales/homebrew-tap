class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.1.0"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.1.0/funpack-mcp-v0.1.0-macos-arm64.tar.gz"
      sha256 "8ac4cb7a0b34599a0daeeab75fc261afdecaed58440bff1053518c5d00828d45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.1.0/funpack-mcp-v0.1.0-linux-arm64.tar.gz"
      sha256 "9886d45f6f3b8f3622b2ab8777d31d4bd6e15db69f50ca8c712b26ae9a66d471"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.1.0/funpack-mcp-v0.1.0-linux-x64.tar.gz"
      sha256 "1a324b24b636ab61bb2ea3994968822bdc846fc8568ca1dd1b54b0829037703b"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
