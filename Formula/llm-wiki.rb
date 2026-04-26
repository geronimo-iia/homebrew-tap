class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.1.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.1.1/aarch64-apple-darwin.tar.gz"
      sha256 "e631ae31fc482dc8a9e82854aa047a7a1edd1b6ca8c67095139066d56ea03dc7"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.1.1/x86_64-apple-darwin.tar.gz"
      sha256 "f22f0da767dc0fc3e99bd49fc0ca9e382fda516cf9fc8b9ff5dc42bd6baa5546"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.1.1/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf90ae0c301df44ca3faf6c45a1a50b396585ba8bd229540d3963b3da12b15a8"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.1.1/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6526c50677e045de12601069d851cb52ae188820c034d8780839f66c5178320c"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
