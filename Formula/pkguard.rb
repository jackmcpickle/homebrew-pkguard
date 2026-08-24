class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "1.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.3/pkguard-darwin-arm64"
      sha256 "c43b870ecea43fe76aff1678b9eb99acaedce55ad3634d079f83e85af0fd1096"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.3/pkguard-darwin-x64"
      sha256 "9df57b7d90a7068d74d483c012064aceccae66c48a79888428a45bfe01929e57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.3/pkguard-linux-arm64"
      sha256 "88f3d5c282e6c499ec382a456c1c37e437139449f37666faaccc2137de264385"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v1.1.3/pkguard-linux-x64"
      sha256 "1e87be7909b3c85a185b6784ce865501cd3251fd9133e367d39c5b996ce546d9"
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
