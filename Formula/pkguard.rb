class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.5/pkguard-darwin-arm64"
      sha256 "436ce7b5e742b7b85d572f7a318ab5c5d9d34e760fe709372a670f912dc9ace0"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.5/pkguard-darwin-x64"
      sha256 "532a812c33a1f8b52189f63d216b4911094e42e9f7c418ffa3fb114601ab958b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.5/pkguard-linux-arm64"
      sha256 "f2a9cfc13a6d59f125093fecef6e607db04cbf7822d25f4610fa05d1dbeda11d"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.5/pkguard-linux-x64"
      sha256 "b7548ea2202ac40dcb73c354763defbd8f90eb3ad019b116d14905003995c76f"
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
