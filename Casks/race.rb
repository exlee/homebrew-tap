cask "race" do
  version "1.0.27"
  sha256 "59fd6842a1d7f9a877dfc6d38b2fcc395ba50b626e30858cda6b5e794f138fef"

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
