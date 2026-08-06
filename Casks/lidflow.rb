cask "lidflow" do
  version "1.0.0"
  sha256 "6bc2edde7bf63ad3117c4b2c3fcef625fdee9a3362c507e920e2f473369929ce"

  url "https://github.com/umairnawaz333/LidFlow/releases/download/v#{version}/LidFlow.zip"
  name "LidFlow"
  desc "MacBook Lid Hinge Angle Sensor Sound Utility"
  homepage "https://github.com/umairnawaz333/LidFlow"

  app "LidFlow.app"

  zap trash: [
    "~/.gemini/antigravity",
  ]
end
