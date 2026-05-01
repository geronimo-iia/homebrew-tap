class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.3.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.3.0/aarch64-apple-darwin.tar.gz"
      sha256 "ffbbbc18ecfc975e80fc6dc9d0f79d0085f562f1c2e14071bb88aeb473099fa6"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.3.0/x86_64-apple-darwin.tar.gz"
      sha256 "d55af083a0aed419bbc37ca9d45974969e2da52b8f28ccea0fe4478e494db911"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.3.0/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b1bd2a74d3fc0ec1c34009c62dbfd40b0805d85415f56c0b9b8243eb01c34b5"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.3.0/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28424ac5a1b8a1964d71d5589d6cba021aa56fa445b36b15d194a65d360e19bf"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
