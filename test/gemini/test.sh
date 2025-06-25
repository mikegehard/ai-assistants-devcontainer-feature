#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json
# Based on the features requested, the test validates that the expected output is generated
# For more information, see https://github.com/devcontainers/cli/blob/main/docs/features/test.md

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "gemini is installed" gemini --version
check "gemini shows help" bash -c "gemini --help | grep -i usage"

# Report result
reportResults