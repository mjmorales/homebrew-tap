class Keel < Formula
  include Language::Python::Virtualenv

  desc "Architectural contract enforcement for LLM-driven codebases"
  homepage "https://github.com/mjmorales/keel"
  url "https://github.com/mjmorales/keel/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "a8059e13ddbfd865e7431a52c3d85c1c169dcc2b28c6b7a835e69cc62519a28d"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION"] = version.to_s
    venv.pip_install buildpath/"cli"
    bin.install_symlink Dir[libexec/"bin/keel"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keel --version")
  end
end
