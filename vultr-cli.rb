# This file was generated by GoReleaser. DO NOT EDIT.
class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  version "0.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/vultr/vultr-cli/releases/download/v0.2.0/vultr-cli_0.2.0_macOs_64-bit.tar.gz"
    sha256 "a04780288b0066a04fe0b3b2c4f9ba3946e3c62363d72a15d213a6524d05e712"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v0.2.0/vultr-cli_0.2.0_linux_64-bit.tar.gz"
      sha256 "abc3d31c824b1a75c689ade78bb708c8737bb39129b2b319b1c0b7cb41055be6"
    end
  end
  
  depends_on "go"

  def install
    bin.install "vultr-cli"
    prefix.install_metafiles
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API key as an environment variable, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
  end
end
