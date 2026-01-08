class Batless < Formula
  desc "Non-blocking, AI-friendly code viewer inspired by bat"
  homepage "https://github.com/docdyhr/batless"
  url "https://github.com/docdyhr/batless/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "60f8f4ac6961c91817c382254f40ad0c19eddb15c76dcc63772b867e85b4b363"
  license "MIT"
  head "https://github.com/docdyhr/batless.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Create a simple test file
    (testpath/"test.rs").write <<~EOS
      fn main() {
          println!("Hello, batless!");
      }
    EOS

    # Test basic functionality
    assert_match "Hello, batless!", shell_output("#{bin}/batless #{testpath}/test.rs")

    # Test version output
    assert_match version.to_s, shell_output("#{bin}/batless --version")

    # Test help output
    assert_match "batless", shell_output("#{bin}/batless --help")

    # Test JSON mode
    json_output = shell_output("#{bin}/batless --mode=json #{testpath}/test.rs")
    assert_match '"mode": "json"', json_output

    # Test summary mode
    summary_output = shell_output("#{bin}/batless --mode=summary #{testpath}/test.rs")
    assert_match "fn main", summary_output
  end
end
