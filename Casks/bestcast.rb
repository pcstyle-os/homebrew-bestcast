cask "bestcast" do
  version "0.12.0"
  sha256 "9da9a2b4a926a504e61926914db10fdfbaeb262bbed6f92edefc528e3838ce56"

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
