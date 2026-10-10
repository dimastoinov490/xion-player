#!/usr/bin/env sh

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
APP_BASE_NAME=$(basename "$0")

# Ensure this file is executable
if [ ! -x "$0" ]; then
  chmod +x "$0"
fi

# Use project-local Gradle distribution if available.
# This avoids depending on a globally installed Gradle version that may not match the project.
if [ -x "$APP_HOME/gradlew" ]; then
  exec "$APP_HOME/gradlew" "$@"
fi

# Fallback to system gradle if wrapper is unavailable.
exec gradle "$@"
