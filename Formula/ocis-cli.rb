class OcisCli < Formula
  desc "Script-friendly CLI for oCIS-compatible servers"
  homepage "https://github.com/mzner/ocis-cli"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_darwin_arm64.tar.gz"
      sha256 "71601780df2e77ed9c7194866609c2b81651fef0b4aa3adf4ecb8c6796eb6d9c"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_darwin_amd64.tar.gz"
      sha256 "f4ea02fba17b8563048b01e8097141faa5bc8b947790126b4be3fc04b27cec71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "242a8783f0ff6da18bd59ee554b85ebfe5dec556a709ed669e1ac32332c8c4f5"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "fdfbf50075376e20ab99a913c51d5d38654cddcb2ac40c30677dbb478041c372"
    end
  end

  def install
    bin.install "ocis"
    generate_completions_from_executable(bin/"ocis", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ocis --version")
  end
end
