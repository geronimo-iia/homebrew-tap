class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "1.0.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.0/aarch64-apple-darwin.tar.gz"
      sha256 "4315f22195b5b1aec768d37d643cd25dcc2e01e3e9de4d0f4ab755d51e89c50f"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.0/x86_64-apple-darwin.tar.gz"
      sha256 "6f7edd1a5dc5604fa1350f9dc271539137d72b3825a06319f9f244d3b3c8e56b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.0/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc679c193933cd291cb9e47d54748e5047c066f53d70b52a67c231d7ae10e7a7"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.0/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "995a76683802c749bb801521d5a66f8c54d13633a97bb53740581a6c6b0a01a6"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
