class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.4/pkguard-darwin-arm64"
      sha256 "07e5295d543f826e4bdad20823c132a0976e58229dc79afc72cfc175e7c6e7a5"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.4/pkguard-darwin-x64"
      sha256 "f1f30c9e13e713536b22d2a06a6e48368e7f570fd082b214a52eb75be083ae74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.4/pkguard-linux-arm64"
      sha256 "41beffea2a1028f457705e0f74a8e00d1c4a7c6486c37105b77edb0536f581d7"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.4/pkguard-linux-x64"
      sha256 "45f3f428439e3af93d09d93edbb093df0f82ea68c8765e26a68451807543db0c"
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
