class Infrapilot < Formula
  desc "InfraPilot CLI — deploy and manage InfraPilot instances"
  homepage "https://infrapilot.org"
  url "https://registry.npmjs.org/@infrapilot/cli/-/cli-0.4.0.tgz"
  sha256 "ee7fa1d765f5327ee9ce18d13e8d6d12d0aa128509ea7e207f25107eca5bfccf"
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
