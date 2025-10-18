# CI/CD Pipeline Documentation

This repository contains a comprehensive CI/CD pipeline for the Homebrew batless formula.

## Workflows

### 1. `test.yml` - Formula Testing
**Triggers:** Push to main/master, PRs, weekly schedule
- Tests formula on macOS 13 and 14
- Validates installation from source
- Tests all batless modes and functionality
- Includes tap installation testing

### 2. `update-formula.yml` - Automated Formula Updates
**Triggers:** Repository dispatch, manual workflow dispatch
- Updates formula version and SHA256 hash
- Validates formula syntax
- Commits changes automatically
- Creates PR for manual updates

### 3. `validate-formula.yml` - Formula Validation
**Triggers:** PRs that modify Formula files
- Validates formula syntax and style
- Ensures formula follows Homebrew guidelines
- Runs on Linux for faster feedback

### 4. `daily-test.yml` - Daily Health Check
**Triggers:** Daily at 6 AM UTC, manual dispatch
- Tests current formula daily
- Catches upstream issues early
- Reports success/failure status

### 5. `check-updates.yml` - Update Monitoring
**Triggers:** Twice daily, manual dispatch
- Compares formula version with latest release
- Creates issues when updates are needed
- Prevents outdated formulas

## Automation Features

- ✅ **Zero-maintenance updates** - Automatic version bumps
- ✅ **Comprehensive testing** - Multiple macOS versions
- ✅ **Early issue detection** - Daily health checks
- ✅ **Update monitoring** - Automatic notifications
- ✅ **Quality validation** - Formula syntax and style checks

## Manual Operations

### Trigger Manual Update
```bash
# Via GitHub UI: Actions → Update Formula → Run workflow
# Requires: version (e.g., v0.2.5) and SHA256 hash
```

### Force Health Check
```bash
# Via GitHub UI: Actions → Daily Formula Test → Run workflow
```

### Check for Updates
```bash
# Via GitHub UI: Actions → Check for Updates → Run workflow
```

## Integration with Main Repository

The main `docdyhr/batless` repository should trigger updates using:

```yaml
- name: Update Homebrew Formula
  uses: peter-evans/repository-dispatch@v3
  with:
    token: ${{ secrets.HOMEBREW_TAP_TOKEN }}
    repository: docdyhr/homebrew-batless
    event-type: update-formula
    client-payload: |
      {
        "version": "${{ github.ref_name }}",
        "sha256": "${{ steps.calculate-sha.outputs.sha256 }}"
      }
```