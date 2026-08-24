class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.2/pkguard-darwin-arm64"
      sha256 "d9d522404195432ade2bc127bdb1fe22b1e0c4dc4cbeb09ee96e951f1fe5116c"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.2/pkguard-darwin-x64"
      sha256 "cd738a168fc07cad26f2ecd67a0d53ba4b37aeb8dab39b1bb28b1be1b1122eee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.2/pkguard-linux-arm64"
      sha256 "88b68309ad9aa01b6e7dd5bb7d6240a62a960e86b5255ae14b81ad320e243abe"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.2/pkguard-linux-x64"
      sha256 "618641f27dcf14d73138410aec2fabd8d462904aa0aef68c8db8baeb2eecd51e"
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
