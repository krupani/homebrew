class Passbox < Formula
  desc "Ruby based minimalistic offline cli password manager using strong AES encryption"
  homepage "https://github.com/krupani/passbox"
  url "https://github.com/krupani/passbox/archive/v2.0.1.tar.gz"
  sha256 "8573809e67a097559d1b8afe03d84e32991c5b1a9dda2338b8cf45f224a542a7"
  license "MIT"

  uses_from_macos "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "#{name}-#{version}.gem"
    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/passbox"
  end
end
