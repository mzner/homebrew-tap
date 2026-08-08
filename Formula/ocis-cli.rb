class OcisCli < Formula
  desc "Script-friendly CLI for oCIS-compatible servers"
  homepage "https://github.com/mzner/ocis-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_darwin_arm64.tar.gz"
      sha256 "d45737ac57aad5ca644d4345bcf584b48a46aee118a231fe9020885742963352"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_darwin_amd64.tar.gz"
      sha256 "7302aa2cadd228355201ec70afa03067f5ba582e937195f4efd8256180ac67a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_linux_arm64.tar.gz"
      sha256 "0e3bbf1d928aabb0e21ca7603fe8ecb0ddff1b449e359450f98fb7082eccbd6a"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.0.0/ocis-cli_1.0.0_linux_amd64.tar.gz"
      sha256 "fb758256484da9d610b9997f92093a75003fe881ede4d2c01af40245382a8aab"
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
