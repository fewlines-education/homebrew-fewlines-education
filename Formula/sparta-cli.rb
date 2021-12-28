class SpartaCli < Formula
  desc "Fewlines Sparta CLI"
  homepage "https://github.com/fewlinesco/sparta-cli"
  url "https://github.com/fewlinesco/sparta-cli/releases/download/1.2.0/sparta-cli-v1.2.0.tar.gz"
  sha256 "64afe72218f996d65a0d872e7b398e71e0b2d0c0e70b9a5d89a5bc57a1782bdf"
  license "MIT"
  depends_on "heroku/brew/heroku-node"

  def install
    inreplace "bin/sparta", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/sparta", "\"$DIR/node\"", "#{Formula["heroku-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sparta"
  end

  test do
    system bin/"sparta", "version"
  end
end
