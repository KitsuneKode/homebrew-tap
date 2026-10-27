class Sweep < Formula
  desc "Artifact cleanup for project trees - scan, review, and reclaim disk space"
  homepage "https://github.com/KitsuneKode/sweep"
  version "0.5.2"
  license "MIT"

  # Regenerate digests with: bin/update-formula <version>
  # The sha256 values come from the release job's .sha256 sidecars.

  on_macos do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-arm64"
      sha256 "46b3ba1b679b19a2162b67d8da03742813fd8d3035e733c665fd9fd0000fc5de"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-x64"
      sha256 "b6dc5ddcfe4a783c5135b4d4b3463b5ad943c7a589ac952e3d28a3685c2e1994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-arm64"
      sha256 "e30de78dfa32e555c05e9fb767a2290971aa19d5da8167b8693236dab6b5c2fd"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-x64"
      sha256 "dd6638ea1e2858daf42e760a87fc4ef65d22a9f8127dc7ab9cf8e8bcb86ea4e4"
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
