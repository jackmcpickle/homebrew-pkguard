class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.0/pkguard-darwin-arm64"
      sha256 "13760d3989c73d881aa20a57caaf5cf8ba423fd93ae9ec7822c8cea84cb76af6"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.0/pkguard-darwin-x64"
      sha256 "1537854236a76e0d7498af1a1f25ba719fc4c8f0bc2702c114b21cebe62af402"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.0/pkguard-linux-arm64"
      sha256 "bddf7160f9ad309a62832d566116f6f7051b35a9eff242639e498ab16437a35f"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.0/pkguard-linux-x64"
      sha256 "e49ddc95c411910253f7c86605c5b3dea5bf23c1a72f0cf67fdb7a26401ab676"
    end
  end

  def install
    binary = Dir["pkguard-*"].first
    odie "pkguard binary missing" if binary.nil?

    chmod 0755, binary
    bin.install binary => "pkguard"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pkguard --version")
  end
end
