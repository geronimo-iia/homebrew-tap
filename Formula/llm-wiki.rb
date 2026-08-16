class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.9"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.9/aarch64-apple-darwin.tar.gz"
      sha256 "d679e3424d2bf357107f22cb0cf084145d68f0413ab5514c9433f458c43fc72b"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.9/x86_64-apple-darwin.tar.gz"
      sha256 "e396bc971068a2822dcc5e04c6bc2ae8af4e2ad3eaa8c10f8122cfc874841119"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.9/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66efedf3f72d28140c1931ef46a0424de8ce9f009f6351844a1c094ea32c5857"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.9/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83820f36b49aa7542af35a16d7273f149082821ed393ad4d9f59abdc37db90b0"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
