cask "sqlab" do
  version "0.6.2"
  sha256 "8f51c743d2244368a02658046efb331bb02dd530811d060bdc43f8fb3b7afc5e"

  url "https://github.com/fhsgoncalves/sqlab/releases/download/v0.6.2/sqlab-aarch64-apple-darwin.dmg",
      verified: "github.com/fhsgoncalves/sqlab/"
  name "sq/lab"
  desc "SQL editor written in Rust using GPUI"
  homepage "https://github.com/fhsgoncalves/sqlab"

  depends_on arch: :arm64

  app "sqlab.app"
  binary "#{appdir}/sqlab.app/Contents/MacOS/sqlab", target: "sqlab"

  caveats <<~EOS
    sq/lab is not currently signed or notarized.
    If macOS blocks the first launch, open System Settings > Privacy & Security
    and click Open Anyway for sqlab.
  EOS

  zap trash: [
    "~/.sqlab",
    "~/Library/Saved Application State/io.github.fhsgoncalves.sqlab.savedState",
  ]
end
