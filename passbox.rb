class Passbox < Formula
  desc "Ruby based minimalistic offline cli password manager using strong AES encryption"
  homepage "https://github.com/krupani/passbox"
  url "https://github.com/krupani/passbox/archive/v2.0.0.tar.gz"
  sha256 "bc438ece99c6c324a553a2218ae839cec780eecc06eacaf554a5929d58f28c39"
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
