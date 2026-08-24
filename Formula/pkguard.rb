class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.3/pkguard-darwin-arm64"
      sha256 "1c58e17e35550ebc4cf3ed4d9de8bfd48dd472c05fa06720befef5602e66640e"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.3/pkguard-darwin-x64"
      sha256 "254abe98171c45210932f9a17484f7d5f35c094c542d935a1d09d3fea0eab00d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.3/pkguard-linux-arm64"
      sha256 "3d5ef876ed0d3e63f19f537da15e9e29229e0029258e2ef23d99b4fab9765d0d"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.3/pkguard-linux-x64"
      sha256 "a61db6aa99e4848ed1c2f3e9cd068cefb52f9c21bd2c977635a152433c090d1c"
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
