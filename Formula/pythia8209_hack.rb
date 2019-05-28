class Pythia8209Hack < Formula
  desc "Monte Carlo Event Generator"
  homepage "https://github.com/jdoss1789"
  url "https://github.com/jdoss1789/homebrew-hep/raw/master/Packages/pythia8209_hack.tgz"
  version "8.209"
  sha256 "ffdf737924f6f8ac67951ac850a5dfb1d1603358a4a746412229a65100120ff8"

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
