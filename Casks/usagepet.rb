cask "usagepet" do
  version "0.4.1"
  sha256 "6171f22e3e92cbc93bb72294c4baf7b169849dd4d93123b089bfbd88f9f96b0f"

  url "https://github.com/bqt1089/UsagePet/releases/download/v#{version}/UsagePet-#{version}.zip"
  name "UsagePet"
  desc "Pixel pet widget for your Claude Code usage limits"
  homepage "https://github.com/bqt1089/UsagePet"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "UsagePet.app"

  uninstall quit: "io.github.bqt1089.UsagePet"

  zap trash: [
    "~/Library/Preferences/io.github.bqt1089.UsagePet.plist",
    "~/Library/Saved Application State/io.github.bqt1089.UsagePet.savedState",
  ]

  caveats <<~EOS
    UsagePet is not notarized yet, so macOS blocks it on first launch.
    Open it once, then go to System Settings → Privacy & Security
    and click "Open Anyway". You only need to do this once per version.
  EOS
end
