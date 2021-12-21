class Go-mustache < Formula
  desc "This library is an implementation of the Mustache template language in Go."
  homepage "https://github.com/cbroglie/mustache"
  url "https://github.com/cbroglie/mustache/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "97d929608b2f5c6b1318225f50dc3b773f3d645f74b670cbe9c3e95940e025ff"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/cbroglie/mustache").install buildpath.children
    cd "src/github.com/cbroglie/mustache" do
      system "go", "build", "-o", bin/"go-mustache", "./cmd/mustache"
    end
  end

  test do
    assert_match /mustache data.yml template.mustache/, shell_output("#{bin}/go-mustache -h", 0)
  end
end
