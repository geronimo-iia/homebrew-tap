class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.3"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.3/aarch64-apple-darwin.tar.gz"
      sha256 "0b54a62b51f253ff1de2ef73d62ddb258088ed6efc1a99e255314ef0fc4e7ff8"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.3/x86_64-apple-darwin.tar.gz"
      sha256 "3276be9352abdef1413b5de457425eaf695743b7c167ccf816b02a0432d7c9e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.3/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd7884bc24de31d281f5860892a428cc1a60f5fd2a9f88032611b87b56e7e2cf"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.3/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adc1edddebcf2a2d2157be8fbcb0eedfabcff37286954dc3352c6bebe8d2bcb3"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
