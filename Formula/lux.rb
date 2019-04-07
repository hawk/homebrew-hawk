class Lux < Formula
  desc "Test automation framework with Expect style execution of commands"
  homepage "https://github.com/hawk/lux"
  url "https://github.com/hawk/lux/archive/lux-2.0.1.tar.gz"
  sha256 "8d21aad2bf443f535c0caa5a83b20e5c57a45a39ecb78058c6988d5fde2addbe"

  head "https://github.com/hawk/lux.git", :branch => "develop"

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
