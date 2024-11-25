class Lux < Formula
  desc "Test automation framework with Expect style execution of commands"
  homepage "https://github.com/hawk/lux"
  url "https://github.com/hawk/lux/archive/refs/tags/lux-3.0.tar.gz"
  sha256 "56f217c0988b81511057d9125e60963f6bb2cca883b63522dea580f666ec8acf"

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
