require "language/node"

class Mustache < Formula
  desc "Mustache templating in javascript"
  homepage "https://github.com/janl/mustache.js"
  url "https://registry.npmjs.org/mustache/-/mustache-4.2.0.tgz"
  sha256 "05ea84bf212d37d84fb201aa77a82b347a6f744a3fcaef750c88e58f889c357c"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

end

