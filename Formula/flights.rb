class Flights < Formula
  desc "fox-lights cli (CLI made in Rust for tuya v3.3 Light Bulbs). A.K.A my OpenClaw server does not support python so I can't just use tinytuya."
  homepage "https://github.com/BrewTheFox/flights"
  url "https://github.com/BrewTheFox/flights/archive/refs/tags/1.0.0.tar.gz"
  sha256 "3c477803314517cf4604be8b7368d90ff358852342e48bba6c9cbd5dcf63b325"
  license "Unlicense"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "flights", shell_output("#{bin}/flights --help")
  end
end
