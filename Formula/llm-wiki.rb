class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.2"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.2/aarch64-apple-darwin.tar.gz"
      sha256 "10883ee60260c476186f5c48af10c7446d832fc94a0317c6f2ce2a77ba2e11e2"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.2/x86_64-apple-darwin.tar.gz"
      sha256 "afd47b1024c5384d96a5903e4c7652e2fcdf8618c673eda6c517508b9f48e045"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.2/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "edce71f66fef9307d3af3653fac2fbcee8f0000e61de4ffe8c7079ff416e9abe"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.2/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c60c4f8052f5bc43f7e11cc4420d91aafef5d1aac622c8b13862d14c717c095c"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
