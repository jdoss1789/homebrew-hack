class Pythia8230Revised < Formula
  desc "Monte Carlo Event Generator"
  homepage "https://github.com/jdoss1789"
  url "https://github.com/jdoss1789/homebrew-hep/raw/master/Packages/pythia8230_revised.tgz"
  version "8.230"
  sha256 "f9cab1ab44bd0dd413116ab78afd74fd2fa858fb000a20cc5a2ca61c27d48006"

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
