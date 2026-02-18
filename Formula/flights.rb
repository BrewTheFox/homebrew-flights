class Flights < Formula
  desc "fox-lights cli (CLI made in Rust for tuya v3.3 Light Bulbs)"
  homepage "https://github.com/BrewTheFox/flights"
  url "https://github.com/BrewTheFox/flights/archive/refs/tags/1.0.0.tar.gz"
  sha256 "3c477803314517cf4604be8b7368d90ff358852342e48bba6c9cbd5dcf63b325"
  license "Unlicense"

  option "with-binary", "Download pre-compiled binary from github releases."

  depends_on "rust" => :build if build.without? "binary"

  resource "binary" do
    url "https://github.com/BrewTheFox/flights/releases/download/1.0.0/flights-linux.tar.gz"
    sha256 "033216ebc89d9f620a57dfd3b94302db6e776bfd74c026b507e8833f47adf536"
  end

  def install
    if build.with? "binary"
      resource("binary").stage do
        bin.install "flights"
      end
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system "#{bin}/flights", "--help"
  end
end
