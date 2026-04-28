class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.2.0/aarch64-apple-darwin.tar.gz"
      sha256 "e0dee0f1ac4f2ea80b2db65a51785bdba3f18a95aa8045f38974132d9bbb9d6c"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.2.0/x86_64-apple-darwin.tar.gz"
      sha256 "53499b2b6f9ed0a125b215498630543f927e0e31498c93af37c62ab2cd32aefd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.2.0/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "278d95b6af84fb0f7bb300e2b2c54d92f14d4706a9afcbe0f39756c8c02233cc"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.2.0/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbb3d752d04fb48448683e5998409dc3c101cc77da51284609d7a75358028d8f"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
