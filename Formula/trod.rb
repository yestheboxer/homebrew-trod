class Trod < Formula
  desc "Persistent directory history with interactive TUI picker"
  homepage "https://github.com/yestheboxer/trod"
  url "https://github.com/yestheboxer/trod/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "507352227c755a580676a8dfa33b17e609f0a4bf0f769b421207d25765c67ac8"
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
