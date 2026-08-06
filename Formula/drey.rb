class Drey < Formula
  desc "Sharing proxy for language servers: one server process per workspace"
  homepage "https://github.com/mario/drey"
  url "https://github.com/mario/drey/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "970f12c9cb87448bfa7d211e2d08b308ef4b97bc743dba2a77222fbc75f68ae0"
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
