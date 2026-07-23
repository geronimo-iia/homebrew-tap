class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.0/aarch64-apple-darwin.tar.gz"
      sha256 "ea6a8d6ebaca71e73b19c9df83a6ed7f8964e512ea9cd7a92e7949339ab05dfe"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.0/x86_64-apple-darwin.tar.gz"
      sha256 "d5e0e2d7b3131e6f3fa3428e612e679c815137393c9082a605a7e6e41ae1661c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.0/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d915e1658bb51dd6440be28976c15914b5985423d907c8b29e337d2635916668"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.0/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed5d6dfdd5f03ac2946c0edcb555f057d0884bc13ffcce8bb3e267489137824c"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
