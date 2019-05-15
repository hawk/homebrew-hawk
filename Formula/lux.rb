class Lux < Formula
  desc "Test automation framework with Expect style execution of commands"
  homepage "https://github.com/hawk/lux"
  url "https://github.com/hawk/lux/archive/lux-2.1.tar.gz"
  sha256 "ba7282217f9a88a59a27656e78ac6c52909b4e73bc2d31fd7f62543f71993a26"

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
   (testpath/"test.lux").write <<~EOS
    [doc Simple test]
    [shell myshell]
        !echo foo
        ?echo foo
        ?^foo
    EOS

    output = shell_output("lux test.lux")
    assert_match "SUCCESS", output
  end
end
