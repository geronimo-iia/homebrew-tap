class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.7"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.7/aarch64-apple-darwin.tar.gz"
      sha256 "8ec12aac6cf8dd4de29832102b6d57dd69feef70accf457a3ed31decbb05e443"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.7/x86_64-apple-darwin.tar.gz"
      sha256 "140f9d14739be33b58bd4d81aa58fd6e8c5c9e9a3257b5b06d357faaff793937"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.7/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a852e98a1cdcdaea433757b6fe662428e5ff359aefb7955d8472c757d2cce726"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.7/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efd02e329ff701bc1f86a053040b7d131d714ac658abfa14204968bccaf8c636"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
