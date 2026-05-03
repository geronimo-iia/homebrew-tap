class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.4.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.0/aarch64-apple-darwin.tar.gz"
      sha256 "97d9092187efb3eb8ab50b314ba1ea6d68405c82a0ff2a7f3c199e73f539a012"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.0/x86_64-apple-darwin.tar.gz"
      sha256 "a314081a8d662cfd66f1e4524ecfa61017a7e7ba381d232ad530c96bb9b66eaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.0/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20930d638b9f870aa4becbe6937893c6af2cdda8b125b77b26bbdfe9d7b9e21e"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.4.0/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "083c410aec3b6443e4c57377c26e5a3e33ff1f9dea28c49ff97f3b5f46bee772"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
