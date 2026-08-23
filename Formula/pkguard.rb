class Pkguard < Formula
  desc "Scan package-manager settings and advisories across a folder of repos"
  homepage "https://pkguard.dev"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v0.1.11/pkguard-darwin-arm64"
      sha256 "da6b42d8a3aef645d15a523d8716705dfc241eba1cf400c7ae10a65e6b9aec38"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v0.1.11/pkguard-darwin-x64"
      sha256 "924a03c887745b6d1100f15f99e44b25a52978458124d9e09862a40495cb826f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v0.1.11/pkguard-linux-arm64"
      sha256 "cb5716cd2ec15c96f0842e7a678300bea206ca62343aaa07776b994ff970edf5"
    end
    on_intel do
      url "https://github.com/jackmcpickle/pkguard/releases/download/v0.1.11/pkguard-linux-x64"
      sha256 "f714649dae33cdfd866f0004469ed4958588928cb7bbaf4e770c6405a2ea2411"
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
