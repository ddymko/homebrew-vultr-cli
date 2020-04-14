# This file was generated by GoReleaser. DO NOT EDIT.
class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  version "0.3.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/vultr/vultr-cli/releases/download/v0.3.0/vultr-cli_0.3.0_macOs_64-bit.tar.gz"
    sha256 "05b438baa70eb6072d171ca9d2adcbb4962f608477e5b75d10ab0757dfabb689"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v0.3.0/vultr-cli_0.3.0_linux_64-bit.tar.gz"
      sha256 "9fd82848e11a0ef3d49016dc32513d4e2bef64319f1ce119fad0cf3af2d93a28"
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
