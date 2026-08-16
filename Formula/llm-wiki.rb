class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "0.5.8"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.8/aarch64-apple-darwin.tar.gz"
      sha256 "d780f4b3976f6b640915011bb0c67ce3355c5d669a5c486411487fac6fd0a3b4"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.8/x86_64-apple-darwin.tar.gz"
      sha256 "3cdb248df0265b709346b2f92269f69130d3c3134e8c0bc705feb01e764aad72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.8/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a86360ce504e4255210b0caf9292d372568b1ff0ec70bf9936e2b30b095728aa"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v0.5.8/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640ce4728c291268bde7eccd5465e00c33cb7853cef65c449c10346ba6f7cac5"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
