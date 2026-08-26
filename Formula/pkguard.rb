class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.0/pkguard-darwin-arm64"
      sha256 "350fc0080a01d33df536b4f88f3df74590e919827b8ca984e0a7f994f9a916c2"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.0/pkguard-darwin-x64"
      sha256 "143eb52e7620afc0299114100aead66ac8cd4b4308d7a8c0283ada38e4e992ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.0/pkguard-linux-arm64"
      sha256 "0720d59a6018928d2a7d6b1a0c73fc66c5d4e1458dc5f8e59073feed29a6cbf4"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.2.0/pkguard-linux-x64"
      sha256 "2ba5630a0659adc11dd9e08c2db2328687fca5f24d2cc22d9b0a709d36100e2a"
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
