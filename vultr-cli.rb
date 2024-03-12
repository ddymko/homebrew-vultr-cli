# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class VultrCli < Formula
  desc "Official command-line tool for Vultr services"
  homepage "https://github.com/vultr/vultr-cli"
  version "3.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.0.2/vultr-cli_v3.0.2_macOs_arm64.tar.gz"
      sha256 "5fc261f990446a471659041a969fd8c221f5dbad8ddf6d7baaecbcf5a1d0f48a"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.0.2/vultr-cli_v3.0.2_macOs_amd64.tar.gz"
      sha256 "cdb61b40652a394a22b273241ccad0060feb341410688325b55d4fa38ec0e2bf"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.0.2/vultr-cli_v3.0.2_linux_arm32-v6.tar.gz"
      sha256 "80bf6748f72119c519c18bb62a7187f9565827795a7339821cccee6532899bd6"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.0.2/vultr-cli_v3.0.2_linux_arm64.tar.gz"
      sha256 "13906a1a50229f878f2651e65edafa353bfb9da118f67bb0bd537ab307e56bb6"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/vultr/vultr-cli/releases/download/v3.0.2/vultr-cli_v3.0.2_linux_amd64.tar.gz"
      sha256 "5ef70648b733bb7eba700074e55d85a71b85a61621dd64662e695b348e587210"

      def install
        bin.install "vultr-cli"
        prefix.install_metafiles
      end
    end
  end

  test do
    output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
    assert_match "Please export your VULTR API key as an environment variable or add `api-key` to your config file, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
  end
end
