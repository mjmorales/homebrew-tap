class ClaudeEnv < Formula
  desc "Manage multiple Claude Code OAuth sessions with easy switching"
  homepage "https://github.com/mjmorales/claude-env"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mjmorales/claude-env/releases/download/v1.5.0/claude-env-darwin-arm64"
      sha256 ""
    else
      url "https://github.com/mjmorales/claude-env/releases/download/v1.5.0/claude-env-darwin-amd64"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mjmorales/claude-env/releases/download/v1.5.0/claude-env-linux-arm64"
      sha256 ""
    else
      url "https://github.com/mjmorales/claude-env/releases/download/v1.5.0/claude-env-linux-amd64"
      sha256 ""
    end
  end

  def install
    binary = Dir["claude-env-*"].first
    bin.install binary => "claude-env"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-env version")
  end
end
