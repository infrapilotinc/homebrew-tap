class Infrapilot < Formula
  desc "InfraPilot CLI — deploy and manage InfraPilot instances"
  homepage "https://infrapilot.org"
  url "https://registry.npmjs.org/@infrapilot/cli/-/cli-0.5.0.tgz"
  sha256 "3fce2f7b615196cb4d70f10c51bf98ea467043213a89fdd8c97379b661c3c594"
  license "AGPL-3.0"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infrapilot --version")
  end
end
