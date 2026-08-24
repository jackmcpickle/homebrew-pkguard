class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.1/pkguard-darwin-arm64"
      sha256 "1fb25cf0dd98ee6445db07a9b147e79a5251e07621818a90c91b22d83a23a1bc"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.1/pkguard-darwin-x64"
      sha256 "2a02f15664756dd7e6789830cec60c33633ee610a0023bfe13eefe1ee1d8499a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.1/pkguard-linux-arm64"
      sha256 "22e3a142e61e1ad8c2346ce6ac9838661e64b1b71fe10bb473e164235b98fdbd"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.1/pkguard-linux-x64"
      sha256 "95309b6b80c3c43126199a9865d03138c1142fa03ddf1359da672440e645b8d2"
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
