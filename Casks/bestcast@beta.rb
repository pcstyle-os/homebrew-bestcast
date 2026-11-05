cask "bestcast@beta" do
  version "0.11.12-beta.4"
  sha256 "2c01258c65abc2dcde7be78732300e1ef2aa79f1e134c24d4c8a618dc567fb8b"

  url "https://github.com/pcstyle-os/bestcast/releases/download/v#{version}/Bestcast-#{version}.dmg"
  name "Bestcast Beta"
  desc "Menu-bar launcher that runs Raycast extensions natively (beta channel)"
  homepage "https://github.com/pcstyle-os/bestcast"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Bestcast Beta.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Bestcast Beta.app"], chdir: "{{appdir}}"
  end

  zap trash: [
    "~/Library/Application Support/com.bestcast.app.beta",
    "~/Library/Caches/com.bestcast.app.beta",
    "~/Library/Preferences/com.bestcast.app.beta.plist",
  ]
end
