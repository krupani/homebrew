class Passbox < Formula
  desc "Ruby based minimalistic offline cli password manager using strong AES encryption"
  homepage "https://github.com/krupani/passbox"
  url "https://github.com/krupani/passbox/archive/v1.0.0.tar.gz"
  sha256 "07e4659dc681fece7d4d381f49294685573c11191b78690448added03d8b1e8a"
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
