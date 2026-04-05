class Keel < Formula
  desc "Architectural contract enforcement for LLM-driven codebases"
  homepage "https://github.com/mjmorales/keel"
  version "1.3.2"
  license "MIT"

  depends_on "docker"

  def install
    bin.install_symlink "/usr/local/bin/docker" => "docker"
    (bin/"keel").write <<~EOS
      #!/bin/bash
      exec docker run --rm -v "$(pwd):/project" ghcr.io/mjmorales/keel:1.3.2 "$@"
    EOS
    (bin/"keel").chmod 0755
  end

  test do
    assert_match "keel", shell_output("#{bin}/keel --help")
  end
end
