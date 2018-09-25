class Pythia8235 < Formula
  desc "Monte Carlo event generator"
  homepage "https://pythia8.hepforge.org"
  url "http://home.thep.lu.se/~torbjorn/pythia8/pythia8235.tgz"
  version "8.235"
  sha256 "332fad0ed4f12e6e0cb5755df0ae175329bc16bfaa2ae472d00994ecc99cd78d"

  depends_on "hepmc"
  depends_on "fastjet"
  depends_on "lhapdf"
  depends_on "boost"

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --with-hepmc2=#{Formula["hepmc"].opt_prefix}
      --with-fastjet3=#{Formula["fastjet"].opt_prefix}
      --with-lhapdf6=#{Formula["lhapdf"].opt_prefix}
      --with-boost=#{Formula["boost"].opt_prefix}
    ]

    system "./configure", *args
    system "make", "install"
  end

  test do
    ENV["PYTHIA8DATA"] = share/"Pythia8/xmldoc"

    cp_r share/"Pythia8/examples/.", testpath
    system "make", "main01"
    system "./main01"
    system "make", "main41"
    system "./main41"
  end
end