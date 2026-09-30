class Sweep < Formula
  desc "Artifact cleanup for project trees - scan, review, and reclaim disk space"
  homepage "https://github.com/KitsuneKode/sweep"
  version "0.4.0"
  license "MIT"

  # Regenerate digests with: bin/update-formula <version>
  # The sha256 values come from the release job's .sha256 sidecars.

  on_macos do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-arm64"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-x64"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-x64"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "sweep-#{os}-#{arch}" => "sweep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sweep --version")
  end
end
