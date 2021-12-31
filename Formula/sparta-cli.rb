class SpartaCli < Formula
  desc "Fewlines Sparta CLI"
  homepage "https://github.com/fewlinesco/sparta-cli"
  url "https://github.com/fewlinesco/sparta-cli/releases/download/1.2.0/sparta-cli-v1.2.0.tar.gz"
  sha256 "dc5cc2a1a43d4db85522aee935e6a6a102ff6943fd6d5ace5e73d83c70854b07"
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
