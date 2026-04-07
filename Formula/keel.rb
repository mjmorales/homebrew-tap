class Keel < Formula
  include Language::Python::Virtualenv

  desc "Architectural contract enforcement for LLM-driven codebases"
  homepage "https://github.com/mjmorales/keel"
  url "https://github.com/mjmorales/keel/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "65bfb5742e62c815d5025ffecc51e963a7e163068926b29c119d4ce759c0bb8f"
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
