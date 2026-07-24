class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.1/aarch64-apple-darwin.tar.gz"
      sha256 "00acc08dd943cdc586fb348c0e67a35a60bc62adc6b274669789114b997be288"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.1/x86_64-apple-darwin.tar.gz"
      sha256 "3ce24c30c9d94c839bad5c304140491fa192185af886f2fcdfd4805fdd988cba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.1/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6dfc50cbb13814a6905de3745141529622f6b2e0db1bcde2aae579f5da912b19"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.1/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d79c4fe48524c9be339b2da93bd5cbc5b23bc05f0859f47c1661c0130b4504a"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
