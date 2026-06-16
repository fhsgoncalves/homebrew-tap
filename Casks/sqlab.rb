cask "sqlab" do
  version "0.6.3"
  sha256 "7f6accfdb2149e8da951a8e1cb491c3530115a08471aecc0a11013fc73dacc5a"

  url "https://github.com/fhsgoncalves/sqlab/releases/download/v0.6.3/sqlab-aarch64-apple-darwin.dmg",
      verified: "github.com/fhsgoncalves/sqlab/"
  name "sq/lab"
  desc "SQL editor written in Rust using GPUI"
  homepage "https://github.com/fhsgoncalves/sqlab"

  depends_on arch: :arm64

  app "sqlab.app"
  binary "#{appdir}/sqlab.app/Contents/MacOS/sqlab", target: "sqlab"

  caveats <<~EOS
    sq/lab is not currently signed or notarized.
    If macOS reports that sqlab is damaged, reinstall without quarantine:

      brew reinstall --cask --no-quarantine fhsgoncalves/tap/sqlab

    Or remove the quarantine attribute after installation:

      xattr -dr com.apple.quarantine /Applications/sqlab.app
  EOS

  zap trash: [
    "~/.sqlab",
    "~/Library/Saved Application State/io.github.fhsgoncalves.sqlab.savedState",
  ]
end
