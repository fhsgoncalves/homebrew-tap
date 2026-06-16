cask "sqlab" do
  version "0.6.4"
  sha256 "668a4654663713941215844395b84ea6173781679cdaebd5b841725a989e5dd2"

  url "https://github.com/fhsgoncalves/sqlab/releases/download/v0.6.4/sqlab-aarch64-apple-darwin.dmg",
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
