# The cask published to the exlee/homebrew-race tap. Edit it here; the release
# workflow rewrites only the two lines below and pushes the result, so a
# hand-edit made in the tap is lost at the next release.
cask "race" do
  version "1.1.4"
  sha256 "4c984409be4a318bcee204f38ecd7e5b78f4ed4eb80822df02d22dce68cf59c8"

  url "https://downloads.race-term.com/releases/v#{version}/RACE.zip"
  name "RACE"
  desc "Canvas workspace holding terminals"
  homepage "https://race-term.com/"

  livecheck do
    url "https://control.race-term.com/latest/race"
    strategy :json do |json|
      next if json.blank?

      json[0..2].join(".")
    end
  end

  depends_on macos: :big_sur

  app "RACE.app"
  binary "#{appdir}/RACE.app/Contents/MacOS/race-mcp"

  zap trash: [
    "~/.config/race",
    "~/.local/state/race",
    "~/Library/Saved Application State/com.race-term.race.savedState",
  ]
end
