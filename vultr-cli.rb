class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  url "https://github.com/vultr/vultr-cli/releases/download/v0.1.8/vultr-cli_0.1.8_macOs_64-bit.tar.gz"
  version "0.1.8"
  sha256 "5387937f9151699938a3d516f3b39539237e7a0f201ae318abfb3158c843961c"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    dir = buildpath/"src/github.com/vultr/vultr-cli"
    dir.install buildpath.children

    cd dir do
      system "go", "build", "-o", bin/"vultr-cli", "-ldflags", "-X main.Version=v#{version}"
      prefix.install_metafiles
    end
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API key as an environment variable, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
  end
end
