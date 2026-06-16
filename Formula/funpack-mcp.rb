class FunpackMcp < Formula
  desc "Model Context Protocol server for the funpack toolchain"
  homepage "https://github.com/mjmorales/funpack"
  version "0.3.4"

  on_macos do
    # Apple Silicon only — funpack-mcp publishes no Intel macOS build.
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.4/funpack-mcp-v0.3.4-macos-arm64.tar.gz"
      sha256 "dcc3099bbb5d73cfac7123e809b1b68f1bdda33e507489a91b0670c795ea4654"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.4/funpack-mcp-v0.3.4-linux-arm64.tar.gz"
      sha256 "74afc64fd626c5432927bee53937bee26d7f668af6bc7bfcfc2f847382366571"
    end
    on_intel do
      url "https://github.com/mjmorales/funpack/releases/download/funpack-mcp-v0.3.4/funpack-mcp-v0.3.4-linux-x64.tar.gz"
      sha256 "63783ac4d2a6fb062431ae9b4e2e20a53c58b323d4aeb37301d29c5482d93a33"
    end
  end

  def install
    bin.install "funpack-mcp"
  end

  test do
    assert_match "funpack-mcp", shell_output("#{bin}/funpack-mcp version")
  end
end
