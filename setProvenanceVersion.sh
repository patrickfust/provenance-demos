#!/bin/bash
set -euo pipefail

# Helper script to set Provenance version in pom.xml's

if [ "$#" -ne 1 ]; then
    echo "Usage: ./setVersion.sh <new-version>"
    echo "Example: ./setVersion.sh 1.2.3"
    exit 1
fi

NEW_VERSION="$1"

echo "[INFO] Setting Provenance version to $NEW_VERSION..."

echo "[INFO] Updating pom.xml's..."
find "$(cd "$(dirname "$0")" && pwd)" -name pom.xml -type f -exec \
    perl -0pi -e 's|<provenance\.version>[^<]+</provenance\.version>|<provenance.version>'"$NEW_VERSION"'</provenance.version>|g' {} +
echo "[INFO] Successfully updated pom.xml files"
