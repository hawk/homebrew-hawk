class Lux < Formula
  desc "Test automation framework with Expect style execution of commands"
  homepage "https://github.com/hawk/lux"
  url "https://github.com/hawk/lux/archive/lux-2.0.tar.gz"
  sha256 "7199de8b970932206246b8700616f0d3077d51e6f574c5c646a78c07a96ad65d"

  head "https://github.com/hawk/lux.git"

  depends_on "autoconf" => :build
  depends_on "erlang"

  def install
    system "autoconf"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    output = shell_output("bin/lux examples/calc.lux")
    assert_match "SUCCESS", output
  end
end
