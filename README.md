# 🍺 Homebrew Tap for batless

This is the official Homebrew tap for [batless](https://github.com/docdyhr/batless) - a non-blocking, AI-friendly code viewer inspired by bat.

## ✨ Automated Updates

This tap is **automatically maintained** - the formula is updated with every `batless` release:

- ✅ **Zero manual maintenance** required
- ✅ **Always up-to-date** with latest releases  
- ✅ **Automatic SHA256 calculation** for security
- ✅ **Comprehensive testing** validates each update
- 🤖 **Powered by GitHub Actions** automation

## 🚀 Installation

### Install batless

```bash
# Add the tap (one-time setup)
brew tap docdyhr/batless

# Install batless
brew install batless
```

### Direct install (without adding tap)

```bash
brew install docdyhr/batless/batless
```

### Keep updated

```bash
# Upgrade to latest version
brew upgrade batless

# Or upgrade everything
brew upgrade
```

## 🤖 What is batless?

**batless** is a minimal, blazing-fast syntax viewer that **never blocks, never pages, never hangs**. Unlike `bat`, it's purpose-built for:

- 🤖 **AI code assistants** that need predictable, streaming output
- 🔄 **CI/CD pipelines** where interactive pagers would hang forever  
- 📜 **Automation scripts** that require guaranteed non-blocking behavior
- 🚀 **Modern workflows** where JSON output and code summaries matter more than line numbers

## 📖 Usage Examples

```bash
# View a file with syntax highlighting
batless src/main.rs

# Plain text output (no colors)
batless --mode=plain src/main.rs

# JSON output for parsing
batless --mode=json src/main.rs

# Extract code structure summary
batless --mode=summary src/main.rs

# Limit output
batless --max-lines=50 large-file.py
```

## ✨ Features

- ✅ **NEVER blocks** - no pager, no interactive prompts
- 🎨 **Syntax highlighting** for 100+ languages
- 📊 **Multiple output modes**: plain, highlighted, JSON, summary  
- 🤖 **AI-optimized** with metadata and token extraction
- 💾 **Memory efficient** - true streaming architecture
- 📦 **Single binary** with minimal dependencies

## 🔄 Release Automation

This Homebrew tap is automatically updated through GitHub Actions:

1. 🏷️ **New release** tagged in [batless repository](https://github.com/docdyhr/batless)
2. 🤖 **Automation downloads** source tarball and calculates SHA256
3. 📝 **Formula updated** with new version and hash
4. ✅ **Changes committed** by `batless-bot`
5. 🍺 **Users get latest** via `brew upgrade batless`

**No manual intervention required!** The formula stays perfectly synchronized with releases.

## 🔗 Links

- **Main Repository**: [github.com/docdyhr/batless](https://github.com/docdyhr/batless)
- **Releases**: [github.com/docdyhr/batless/releases](https://github.com/docdyhr/batless/releases)
- **Crates.io**: [crates.io/crates/batless](https://crates.io/crates/batless)
- **Documentation**: [docs.rs/batless](https://docs.rs/batless)
- **Issues**: [github.com/docdyhr/batless/issues](https://github.com/docdyhr/batless/issues)

## 🛠️ Technical Details

- **Formula Location**: [`Formula/batless.rb`](Formula/batless.rb)
- **Automation Workflow**: [`update-homebrew.yml`](https://github.com/docdyhr/batless/blob/main/.github/workflows/update-homebrew.yml)
- **Build Method**: Compiles from source using Rust toolchain
- **Testing**: Comprehensive formula tests validate installation

## 🆘 Support

- **Formula Issues**: Open an issue in this repository
- **batless Issues**: Use the [main repository](https://github.com/docdyhr/batless/issues)
- **Installation Help**: Check the [main README](https://github.com/docdyhr/batless#-homebrew-tap)

---

**Made with ❤️ and 🤖 automation for seamless Homebrew experience**