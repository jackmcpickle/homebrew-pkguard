class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.1/pkguard-darwin-arm64"
      sha256 "8b43ed3f89039372d7821f0fa630b022c0b5d4a892fa7eb2c60e4f0495fa06f0"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.1/pkguard-darwin-x64"
      sha256 "f662d2d983097bd2c2ada9223055f48810baa1d93e37647d8132c305f372f4e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.1/pkguard-linux-arm64"
      sha256 "b5c13010d9ff5af50835fa7a51cd595f3931919b307e2b647dee2527a9ae864c"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.1/pkguard-linux-x64"
      sha256 "9b0a8b35b1ed8dfba3443829656e5caba430a55bd486ce5293adf03bc56429ae"
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
