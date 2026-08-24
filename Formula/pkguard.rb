class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.2/pkguard-darwin-arm64"
      sha256 "a0b3f27ed34c34a69554112f3139a13171800314195280fbe300994047e6fe4c"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.2/pkguard-darwin-x64"
      sha256 "8cfa29d9544cb5dd79b6f389a381f38ed842b564b5bdd57516f431dd7c0598ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.2/pkguard-linux-arm64"
      sha256 "f162c8597f6fcae3b79ae9e9997132c29112dbc292ca01c82908a381dd996aac"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.0.2/pkguard-linux-x64"
      sha256 "f9627058e47f680804f1fac1f73e54325756d74bd9d66fb17d4466e2d416a7c1"
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
