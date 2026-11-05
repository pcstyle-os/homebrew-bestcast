cask "bestcast-universal" do
  version "0.11.11"
  sha256 "d490e2552e8486fad42d8991077a3b5a2927d061223f5fa3632374db0962296c"

  url "https://github.com/pcstyle-os/bestcast/releases/download/v#{version}/Bestcast-Universal-#{version}.dmg"
  name "Bestcast"
  desc "Menu-bar launcher that runs Raycast extensions natively (Universal build)"
  homepage "https://github.com/pcstyle-os/bestcast"

  auto_updates true
  conflicts_with cask: "bestcast"
  depends_on macos: :tahoe

  app "Bestcast.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Bestcast.app"], chdir: "{{appdir}}"
  end

  zap trash: [
    "~/Library/Application Support/com.bestcast.app",
    "~/Library/Caches/com.bestcast.app",
    "~/Library/Preferences/com.bestcast.app.plist",
  ]
end
