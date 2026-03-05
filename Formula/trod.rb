class Trod < Formula
  desc "Persistent directory history with interactive TUI picker"
  homepage "https://github.com/yestheboxer/trod"
  url "https://github.com/yestheboxer/trod/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7cff715b9133738318e5c69928e59462e3289ad7c0d323ba7f179f3ec812e641"
  license "MIT"

  depends_on "rust" => :build

  def caveats
    <<~EOS
      Add the following to your shell config to enable trod:

      For zsh (~/.zshrc):
        eval "$(trod init zsh)"

      For bash (~/.bashrc):
        eval "$(trod init bash)"

      This gives you automatic directory tracking, the `td` alias,
      and Ctrl-G to launch the interactive picker.
    EOS
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/trod", "--version"
  end
end
