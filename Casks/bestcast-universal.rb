cask "bestcast-universal" do
  version "0.12.0"
  sha256 "e32426116ddced470cf6e9d6acc4279dd1399782744c4b9764bd503984fbf4ef"

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
