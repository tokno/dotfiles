#!/bin/bash -e

# agent/skills 配下の各スキルを ~/.claude/skills へ symlink する
# 引数でリンク先を変えられる: install_agent_skills.sh [リンク先ディレクトリ]

dotfiles=`git -C "$(dirname "$0")" rev-parse --show-toplevel`
target=${1:-~/.claude/skills}

mkdir -p "$target"

for d in "$dotfiles"/agent/skills/*/; do
    # スキルが1つもないと glob がそのまま残るので飛ばす
    [ -d "$d" ] || continue

    name=$(basename "$d")
    link="$target/$name"

    # symlink でない実体がある場合は上書きしない
    if [ -e "$link" ] && [ ! -L "$link" ]; then
        echo "skip: $link already exists and is not a symlink."
        continue
    fi

    ln -sfn "${d%/}" "$link"
    echo "linked: $link -> ${d%/}"
done
