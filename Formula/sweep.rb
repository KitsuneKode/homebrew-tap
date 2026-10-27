class Sweep < Formula
  desc "Artifact cleanup for project trees - scan, review, and reclaim disk space"
  homepage "https://github.com/KitsuneKode/sweep"
  version "0.5.1"
  license "MIT"

  # Regenerate digests with: bin/update-formula <version>
  # The sha256 values come from the release job's .sha256 sidecars.

  on_macos do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-arm64"
      sha256 "af79ba68e63677df7a07d690ef72ac3952b1e5bd2ace35a2676b5ff63eff77e5"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-x64"
      sha256 "aa157e38256e61dff09f0edd86014b4c7a66d55cf1ee2c326b5fdf84587fcd0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-arm64"
      sha256 "c86f7dcf8a2c93300a9992cf6d78b47901b9c09ef89aff0446afd264bed4334a"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-x64"
      sha256 "a4693c92509c7c37f642b85e2eeb0dd9e910afad19f6d0d79d534222e4d08ac4"
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
