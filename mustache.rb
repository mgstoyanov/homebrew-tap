require "language/node"

class Mustache < Formula
  desc "Mustache templating in javascript"
  homepage "https://github.com/janl/mustache.js"
  url "https://registry.npmjs.org/mustacje/-/mustache-4.2.0.tgz"
  sha256 "c8b1d437305bc4c492cb9b85bb1b91edb5cc74fa91bd007616746c6258dae6c5"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

end

