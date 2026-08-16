class OcisCli < Formula
  desc "Script-friendly CLI for oCIS-compatible servers"
  homepage "https://github.com/mzner/ocis-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.2.0/ocis-cli_1.2.0_darwin_arm64.tar.gz"
      sha256 "e0c7039482968ca4b026d463dabb0b1b06b8446dd5d4bb231bc55d94addcb8b8"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.2.0/ocis-cli_1.2.0_darwin_amd64.tar.gz"
      sha256 "503bf7ebb7463e2cb545dda5f4a5a60a4c295fcac5626485bc49b9e3c6c835d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.2.0/ocis-cli_1.2.0_linux_arm64.tar.gz"
      sha256 "74c6820cd69d3eedd65aa302b160820aeb0a0ea13a08034c144bf14de0abafe6"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.2.0/ocis-cli_1.2.0_linux_amd64.tar.gz"
      sha256 "714d234f7a75d2cc630fb048210ba8b628cc4f3d93d890c475ffe1700ce15496"
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
