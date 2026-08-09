class OcisCli < Formula
  desc "Script-friendly CLI for oCIS-compatible servers"
  homepage "https://github.com/mzner/ocis-cli"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.1.0/ocis-cli_1.1.0_darwin_arm64.tar.gz"
      sha256 "dcab6331ec9029e999eb69df5aec46aa98a7c1f03cf65b378286a4041466654a"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.1.0/ocis-cli_1.1.0_darwin_amd64.tar.gz"
      sha256 "39223611d20bc0a15f290acaf87880075a765fa1b3c10407d7df99e7b4124919"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mzner/ocis-cli/releases/download/v1.1.0/ocis-cli_1.1.0_linux_arm64.tar.gz"
      sha256 "fce1ae55368ab98b2e130e6505ca0bf4531608c3e4642157b0242b1a6d046a9e"
    else
      url "https://github.com/mzner/ocis-cli/releases/download/v1.1.0/ocis-cli_1.1.0_linux_amd64.tar.gz"
      sha256 "71c34a2bec7c07d8d83d696bb073fa912b15f863030c758e3a4e3664a5f70afe"
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
