# The cask published to the exlee/homebrew-race tap. Edit it here; the release
# workflow rewrites only the two lines below and pushes the result, so a
# hand-edit made in the tap is lost at the next release.
cask "race" do
  version "1.0.39"
  sha256 "9feeae11f7444107c92c6be60f95a40dded2be88744e06c13453126d7e3fc690"

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
    # Where the session, the sockets and the install id live on macOS. RACE
    # follows XDG_STATE_HOME when it is set, which a cask cannot know about.
    "~/Library/Application Support/race",
    "~/Library/Saved Application State/com.race-term.race.savedState",
  ]
end
