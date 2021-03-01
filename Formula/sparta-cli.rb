class SpartaCli < Formula
  desc "The Fewlines Sparta CLI"
  homepage "https://sparta.fewlines.dev"
  url "https://github.com/fewlinesco/sparta-cli/releases/download/1.1.0/sparta-v1.1.0-darwin-x64.tar"
  sha256 "e87e9067dead16fe3a72f0d7f7241a3dab73f0233f6a924ff378e765648083f5"
  license "MIT"
  depends_on "heroku/brew/heroku-node"

  def install
    inreplace "bin/sparta", /^CLIENT_HOME=/, "export HEROKU_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/sparta", "\"$DIR/node\"", "#{Formula["heroku-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sparta"
  end

  test do
    system bin/"heroku", "version"
  end
end
