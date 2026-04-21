class Agentctl < Formula
  desc "CLI for agent hub validation, index generation, and skill management"
  homepage "https://github.com/geronimo-iia/agentctl"
  version "0.5.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/agentctl/releases/download/v0.5.1/aarch64-apple-darwin.tar.gz"
      sha256 "69a5df894f88c2e63aa14a9083fa142faa895ef00f21a3f040bd5941d2660022"
    else
      url "https://github.com/geronimo-iia/agentctl/releases/download/v0.5.1/x86_64-apple-darwin.tar.gz"
      sha256 "b4b292402e1dcbd59180c7ba701d495bb31a285546c8cb35eb55616d2cc39fe9"
    end
  end

  def install
    bin.install "agentctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentctl --version")
  end
end
