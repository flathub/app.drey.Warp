#!/bin/sh
git pull --rebase 'https://github.com/flathub/app.drey.Warp.git' -Xtheirs beta

GITLAB_PROJECT_ID=19921
REF=${1:-"main"}

wget -O app.drey.Warp.yaml https://gitlab.gnome.org/World/warp/-/raw/$REF/build-aux/app.drey.Warp.yaml?inline=false
wget -O cargo-sources.json https://gitlab.gnome.org/World/warp/-/raw/$REF/build-aux/cargo-sources.json?inline=false

COMMIT=$(curl "https://gitlab.gnome.org/api/v4/projects/${GITLAB_PROJECT_ID}/repository/commits?ref_name=$REF" | jq -r '.[0].id')
sed -i "s/commit: main/commit: ${COMMIT}/" app.drey.Warp.yaml
