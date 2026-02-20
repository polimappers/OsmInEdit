#!/bin/bash
set -euo pipefail

if [ ! -d build ]; then
	echo "build/ directory not found" >&2
	exit 1
fi

git clone -b deploy https://github.com/polimappers/OsmInEdit.git OsmInEdit

# Sync build into the cloned repo, deleting extraneous files but preserving .git
rsync -a --delete --exclude='.git' build/ OsmInEdit/

rm -r build

cd OsmInEdit
git add -A
# Commit only if there are changes
if git diff --cached --quiet; then
	echo "No changes to deploy"
else
	git commit -m 'deploy'
	git push origin deploy
fi

cd ../
rm -rf OsmInEdit
