class PythiaHack < Formula
  desc "Monte Carlo event generator"
  url "https://www.dropbox.com/s/blmq0obt16yedhy/pythia_hack.tgz?dl=0"
  version "8.209"
  sha256 "0795c889e8872952779c0f168073f33290bfef7c83bd479c50666efe2b1f7865"

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

  def caveats; <<-EOS.undent
    It is recommended to 'brew install sacrifice' now, as
    the easiest way to generate Pythia 8 events.

    Otherwise, programs can be built against the Pythia 8
    libraries by making use of 'pythia8-config'.

    EOS
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