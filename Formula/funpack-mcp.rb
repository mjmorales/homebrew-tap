class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.3"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.3/funpack-mcp-v0.3.3-macos-arm64.tar.gz"
      sha256 "0feb8c9e4e7c5a883a9359318f4158134402ea5ff4c01c8c8e99fc00e3b1260a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.3/funpack-mcp-v0.3.3-linux-arm64.tar.gz"
      sha256 "db4d9f817979e6d0420102bd5b976131102a958ace89ddb2d5806fada6112f4b"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.3/funpack-mcp-v0.3.3-linux-x64.tar.gz"
      sha256 "7577d74606b61408e064bb8ad16a60236c987ba659bcf1050dad28072c71ff56"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
