class Starship < Formula
  desc "The cross-shell prompt for astronauts"
  homepage "https://github.com/starship/starship"
  url "https://github.com/starship/starship/archive/v0.2.0.tar.gz"
  sha256 "27df9d27e7e5687bd16b8d7b3805b4687f667d76300e4b90e1770f925c27bade"
  head "https://github.com/starship/starship.git"

  bottle do
    cellar :any
    sha256 "462a8bbc795fff9e83778178d168e6f4a47bfbefdfd729d56794c9f21096562c" => :mojave
    sha256 "01c3ff50b61f157b10da7f85e16c5289e005f8fdc5a179c2692f49e5e350e64b" => :high_sierra
    sha256 "48e16c851cdda5e1426f5c647c2b3148a11049242001515240df274506e828dc" => :sierra
  end

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
  end

  test do
    ENV["STARSHIP_CONFIG"] = ""
    assert_equal "[1;32m➜[0m ", shell_output("#{bin}/starship module char")
  end
end
