#!/usr/bin/env bash
set -euo pipefail

REPO="geronimo-iia/llm-wiki"
FORMULA="$(cd "$(dirname "$0")/.." && pwd)/Formula/llm-wiki.rb"


TARGETS=(
  aarch64-apple-darwin.tar.gz
  x86_64-apple-darwin.tar.gz
  aarch64-unknown-linux-gnu.tar.gz
  x86_64-unknown-linux-gnu.tar.gz
)

# 1. Get latest release tag and notes
TAG=$(gh release view --repo "$REPO" --json tagName -q '.tagName')
VERSION="${TAG#v}"
echo "Latest release: $TAG (version $VERSION)"

# 2. Download assets and compute SHA256
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

declare -A SHAS
for asset in "${TARGETS[@]}"; do
  echo "Downloading $asset..."
  gh release download "$TAG" --repo "$REPO" --pattern "$asset" --dir "$TMPDIR"
  SHAS[$asset]=$(shasum -a 256 "$TMPDIR/$asset" | awk '{print $1}')
  echo "  sha256: ${SHAS[$asset]}"
done

# 3. Rewrite formula
cat > "$FORMULA" <<EOF
class LlmWiki < Formula
  desc "Git-backed wiki engine with MCP server"
  homepage "https://github.com/$REPO"
  version "$VERSION"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/$REPO/releases/download/$TAG/aarch64-apple-darwin.tar.gz"
      sha256 "${SHAS[aarch64-apple-darwin.tar.gz]}"
    else
      url "https://github.com/$REPO/releases/download/$TAG/x86_64-apple-darwin.tar.gz"
      sha256 "${SHAS[x86_64-apple-darwin.tar.gz]}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/$REPO/releases/download/$TAG/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "${SHAS[aarch64-unknown-linux-gnu.tar.gz]}"
    else
      url "https://github.com/$REPO/releases/download/$TAG/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "${SHAS[x86_64-unknown-linux-gnu.tar.gz]}"
    end
  end

  def install
    bin.install "llm-wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/llm-wiki --version")
  end
end
EOF

echo "Formula updated to $VERSION"
echo ""
echo "Next steps:"
echo "  cd $(dirname "$FORMULA")/.."
echo "  git add Formula/llm-wiki.rb"
echo "  git commit -m 'chore: bump llm-wiki to $VERSION'"
echo "  git push"
