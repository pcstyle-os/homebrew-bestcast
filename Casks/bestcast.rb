cask "bestcast" do
  version "0.11.11"
  sha256 "320da9bc4791fed33316183bfb6e25f04e65d24f564de045c4d111d0b3aeb7d9"

  url "https://github.com/pcstyle-os/bestcast/releases/download/v#{version}/Bestcast-#{version}.dmg"
  name "Bestcast"
  desc "Menu-bar launcher that runs Raycast extensions natively"
  homepage "https://github.com/pcstyle-os/bestcast"

  auto_updates true
  conflicts_with cask: "bestcast-universal"
  depends_on arch: :arm64
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
