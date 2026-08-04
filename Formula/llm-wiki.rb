class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.4"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.4/aarch64-apple-darwin.tar.gz"
      sha256 "b483298ddbe54737fafcc8fc5100a43e2903c612d7403d7058950cf62cbdb817"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.4/x86_64-apple-darwin.tar.gz"
      sha256 "8de6662851a7f544ea6fb9d5876e47830122cf9aa323cf74fb189cd5fae84b47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.4/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e3c135d69fcb77ec3322eac992b5dbae7be6a416dbcc75d32dc00f7ebb16299"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.4/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "283438a06ece57033a2b83e34eee75495b50f878f503e9371126853c66c66fbb"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
