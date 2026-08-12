class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.5"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.5/aarch64-apple-darwin.tar.gz"
      sha256 "36a7e29296842548b12610bf308ef4b409838c66318420f32f83bd85148ccc19"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.5/x86_64-apple-darwin.tar.gz"
      sha256 "ef30af8a935851c9890cadf888996e7b88529beeff61dcc3b62ab5973a40fd90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.5/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "788bc0a735a17f1625c1d9c27f693305a138c4be354acc7a94ceeda1f0de36e9"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.5/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ffaf9a3779866a715d4bc2d9ed4a85a6fdde9f967058cf86b091496bcbea20a"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
