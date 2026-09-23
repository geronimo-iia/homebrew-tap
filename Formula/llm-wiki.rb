class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/geronimo-iia/llm-wiki"
  version "1.0.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.1/aarch64-apple-darwin.tar.gz"
      sha256 "fafbcffeee1d859094937540b3a2ee8a5051214070ced036200f27d5c6ebb88f"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.1/x86_64-apple-darwin.tar.gz"
      sha256 "897bfd94bfec699ca209a09952b7aa65bbcfa7e92bb993d981f88d6baf3b7530"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.1/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca85d91ef30c52f1e7b793566680e441fbaee558eb01f33988f7492cf61d4f24"
    else
      url "https://github.com/geronimo-iia/llm-wiki/releases/download/v1.0.1/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebe8abc79db1a5b15589b18cc21065a215d370931d0ebcf2ab4903aa1f92d306"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
