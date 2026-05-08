class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.4.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.1/aarch64-apple-darwin.tar.gz"
      sha256 "12bea267ab0681ea184277a1c8cd48a2d1f97994ac3939f024d2956d1cb2b34f"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.1/x86_64-apple-darwin.tar.gz"
      sha256 "9a3eb669455125231f28232a3b9a9bd6d7e1f9141e7d34c52ffaf60fa0c64452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.1/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "648d7216050d279537fa013b9bee9e70330db36fbf5c501192f668a3ed1663b4"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.1/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54428519e677d3f7605d8a366e145c0a20d556e577d1bea2b90168a505a51886"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
