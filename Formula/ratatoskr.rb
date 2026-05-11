class Ratatoskr < Formula
  desc "Conservative local disk scanner for developer machines"
  homepage "https://odinns.github.io/ratatoskr/"
  url "https://github.com/odinns/ratatoskr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "159c857d9681e5c832713c360daa7eb8b78495ad734dcefbfa335d08abf243f0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"ratatoskr"), "./cmd/ratatoskr"
  end

  test do
    assert_match "ratatoskr", shell_output("#{bin}/ratatoskr --help")
    system bin/"ratatoskr", "rules"
  end
end
