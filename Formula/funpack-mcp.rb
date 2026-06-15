class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.2.1"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.1/funpack-mcp-v0.2.1-macos-arm64.tar.gz"
      sha256 "111fd5270f7d2806c806c7b751e080c880476d3db4ab84491ddedc5bfd0cb54a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.1/funpack-mcp-v0.2.1-linux-arm64.tar.gz"
      sha256 "20cdf71eeadcd6c0d74050a3b9ba11b0eb605c37c1aefbfd0a18243a89920a41"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.2.1/funpack-mcp-v0.2.1-linux-x64.tar.gz"
      sha256 "83872a71ec9fbe532e0777bc95f177ead6926be86ad130255fe214636e693ac9"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
