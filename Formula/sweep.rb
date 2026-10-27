class Sweep < Formula
  desc "Artifact cleanup for project trees - scan, review, and reclaim disk space"
  homepage "https://github.com/KitsuneKode/sweep"
  version "0.5.0"
  license "MIT"

  # Regenerate digests with: bin/update-formula <version>
  # The sha256 values come from the release job's .sha256 sidecars.

  on_macos do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-arm64"
      sha256 "79413ecd0934e8b8441d17fea1ebc90813f7d1020c19a372a9a084cc028ccf36"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-darwin-x64"
      sha256 "780398361547ec7f220c6ea6b46d0981176c7bd6d2800bc297ae067883512557"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-arm64"
      sha256 "2e28e09792f311c6874d8bf7955965735b1e04fae75a2713b423f9ca439483d7"
    end
    on_intel do
      url "https://github.com/KitsuneKode/sweep/releases/download/v#{version}/sweep-linux-x64"
      sha256 "60b051b69a5dab1875cf4f54e604389736fd374329e955b81d8ab5e4d1c7d438"
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
