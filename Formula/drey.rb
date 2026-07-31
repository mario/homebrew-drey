class Drey < Formula
  desc "Sharing proxy for language servers: one server process per workspace"
  homepage "https://github.com/mario/drey"
  url "https://github.com/mario/drey/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "70979875f7e26e7f15a72584ffd460c97662a6c7a1a7a0abcb7cefe6e5e68e63"
  license "Apache-2.0"
  head "https://github.com/mario/drey.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "drey", shell_output("#{bin}/drey --help")
    # The daemon must not be running for this to be meaningful: status exits
    # non-zero and says so, rather than starting one as a side effect.
    output = shell_output("#{bin}/drey status 2>&1", 1)
    assert_match "no drey daemon is running", output
  end
end
