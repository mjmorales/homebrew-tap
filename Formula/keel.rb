class Keel < Formula
  include Language::Python::Virtualenv

  desc "Architectural contract enforcement for LLM-driven codebases"
  homepage "https://github.com/mjmorales/keel"
  url "https://github.com/mjmorales/keel/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "ed6e9ad50e438a56244c4b9a802aa9981e5e6844ed299dc3f33fb4742e1dea3f"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    ENV["SETUPTOOLS_SCM_PRETEND_VERSION"] = version.to_s
    # Homebrew's `venv.pip_install` runs pip with `--no-deps --no-binary :all:`
    # under build isolation. keel's build backend is hatchling, which is
    # self-hosting, so building it from source needs hatchling — pip deadlocks
    # ("hatchling ... is already being built"). Bootstrap pip into the venv and
    # do a normal install so binary wheels satisfy the build backend.
    system libexec/"bin/python", "-m", "ensurepip"
    system libexec/"bin/python", "-m", "pip", "install", "-v", buildpath/"cli"
    bin.install_symlink Dir[libexec/"bin/keel"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keel --version")
  end
end
