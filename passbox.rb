class Passbox < Formula
  desc "Ruby based minimalistic offline cli password manager using strong AES encryption"
  homepage "https://github.com/krupani/passbox"
  url "https://github.com/krupani/passbox/archive/v1.0.1.tar.gz"
  sha256 "8e36d050ed7d7745bbeb8131ccb7c753a715589e715f738aee283a8ea4dbfa7c"
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
