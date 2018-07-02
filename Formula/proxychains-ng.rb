class ProxychainsNg < Formula
  desc "Hook preloader"
  homepage "https://sourceforge.net/projects/proxychains-ng/"
  url "https://github.com/rofl0r/proxychains-ng/archive/v4.13.tar.gz"
  sha256 "ff15295efc227fec99c2b8131ad532e83e833a02470c7a48ae7e7f131e1b08bc"
  head "https://github.com/rofl0r/proxychains-ng.git"

  bottle do
    sha256 "0ffdd8d99f0b9e6f3d90829dfb8237cefee718b9095c9432bd39d929b31c7240" => :high_sierra
    sha256 "5e6fec4ad1150223a3c97d353b22085632dd634181ff85f7c125f49b74975710" => :sierra
    sha256 "ac61e782f334b00180f7b0008e4c5da35ee9f5632821a806c99af7b144938916" => :el_capitan
    sha256 "2298ad9f27411a1da59bd925bf9cf49ae5579d368acbaebf1c29103e84684a09" => :yosemite
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}"
    system "make"
    system "make", "install"
    system "make", "install-config"
  end

  test do
    assert_match "config file found", shell_output("#{bin}/proxychains4 test 2>&1", 1)
  end
end
