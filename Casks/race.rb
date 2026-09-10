# The cask published to the exlee/homebrew-race tap. Edit it here; the release
# workflow rewrites only the two lines below and pushes the result, so a
# hand-edit made in the tap is lost at the next release.
cask "race" do
  version "1.1.1"
  sha256 "383d837c6dd893367c95f5033dc1d1873d97ae4da44fcf0de0e31615593531fb"

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
