# The cask published to the exlee/homebrew-race tap. Edit it here; the release
# workflow rewrites only the two lines below and pushes the result, so a
# hand-edit made in the tap is lost at the next release.
cask "race" do
  version "1.0.38"
  sha256 "70a7a00976311f104f2138ca665ed9018541a0c9d11e944b5f1aa08770814652"

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
