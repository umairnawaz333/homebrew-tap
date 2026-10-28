cask "ai-usage" do
  version "0.1.0"
  sha256 "f4bb40352780045d4eeeb3983cf67abd23b7b6e61625082b20c7b71c8f9c6064"

  url "https://github.com/umairnawaz333/AIUsage/releases/download/v#{version}/AI-Usage.zip"
  name "AI Usage"
  desc "Shows Claude usage limits next to the MacBook notch"
  homepage "https://github.com/umairnawaz333/AIUsage"

  depends_on macos: ">= :sonoma"

  app "AI Usage.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/AI Usage.app"],
                   sudo: false
  end

  uninstall quit: "com.umairnawaz.AIUsage"

  # Restore the user's original Claude Code status line before removing the bridge.
  zap script: {
        executable: "#{appdir}/AI Usage.app/Contents/MacOS/AIUsage",
        args:       ["--disconnect"],
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/AIUsage",
        "~/Library/Preferences/com.umairnawaz.AIUsage.plist",
      ]

  caveats <<~EOS
    Open AI Usage and click Connect in Settings to link it to Claude Code.
    To remove it completely (and restore your original status line), use:
      brew uninstall --zap --cask ai-usage
  EOS
end
