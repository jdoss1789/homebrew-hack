class FeynRules < Formula
  desc "Mathematica Package"
  homepage "https://feynrules.irmp.ucl.ac.be/"
  url "http://feynrules.irmp.ucl.ac.be/downloads/feynrules-current.tar.gz"
  version "2.3"
  sha256 "9ca695d10ba5073571a7b6f7933f3745c6d7e6f4ee4e925f424e59e3198c200a"

 def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
  end

  test do
    system "true"
  end
end
