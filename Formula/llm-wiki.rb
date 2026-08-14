class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.6"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.6/aarch64-apple-darwin.tar.gz"
      sha256 "4a39765497a9b4adc778c7625340dd92ebaba2882c7d5f36dbb7f3b9a118d92b"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.6/x86_64-apple-darwin.tar.gz"
      sha256 "96c1d51e80d3605e545500301a08d41e1ef59734f0b1b66fe6e28756709c1a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.6/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7173eb29cb342267bce0858a30386c4e1c91d20a7452e1ee2b48d140fa45fc87"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.6/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49190dc8b384a7f32106d21d100b4705ea27bbfbd14eeb8b1c1b9ea9cda3b4e5"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
