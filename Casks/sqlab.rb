cask "sqlab" do
  version "0.7.1"
  sha256 "e9666756da12f1b1420db91ab464706e832d528ff56b39409b74409907bf1e7e"

  url "https://github.com/fhsgoncalves/sqlab/releases/download/v0.7.1/sqlab-aarch64-apple-darwin.dmg",
      verified: "github.com/fhsgoncalves/sqlab/"
  name "sq/lab"
  desc "SQL editor written in Rust using GPUI"
  homepage "https://github.com/fhsgoncalves/sqlab"

  depends_on arch: :arm64

  app "sqlab.app"
  binary "#{appdir}/sqlab.app/Contents/MacOS/sqlab", target: "sqlab"

  caveats <<~EOS
    sq/lab is not currently signed or notarized.
    If macOS reports that sqlab is damaged after installation, remove the
    quarantine attribute:

      xattr -dr com.apple.quarantine /Applications/sqlab.app
  EOS

  zap trash: [
    "~/.sqlab",
    "~/Library/Saved Application State/io.github.fhsgoncalves.sqlab.savedState",
  ]
end
