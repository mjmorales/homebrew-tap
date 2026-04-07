class Keel < Formula
  include Language::Python::Virtualenv

  desc "Architectural contract enforcement for LLM-driven codebases"
  homepage "https://github.com/mjmorales/keel"
  url "https://github.com/mjmorales/keel/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "235060f0ebd79be36343d513c8bd1cb0e091a6e82332aaabbee9d49369620b06"
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
