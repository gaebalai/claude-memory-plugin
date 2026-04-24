#!/usr/bin/env bash
# install-commands.sh
#
# 플러그인 시스템을 사용하지 않고 슬래시 커맨드만 전역 설치하는 스크립트.
#
# 사용법:
#   bash install-commands.sh              # 전역 설치 (~/.claude/commands/)
#   bash install-commands.sh --project    # 현재 프로젝트에만 설치 (./.claude/commands/)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/plugins/memory-system/commands"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "❌ 커맨드 디렉터리를 찾을 수 없습니다: $SOURCE_DIR"
  exit 1
fi

if [ "${1:-}" = "--project" ]; then
  TARGET_DIR="./.claude/commands"
  SCOPE="프로젝트"
else
  TARGET_DIR="$HOME/.claude/commands"
  SCOPE="전역"
fi

mkdir -p "$TARGET_DIR"

echo "📥 $SCOPE 설치 시작: $TARGET_DIR"
echo ""

COUNT=0
for f in "$SOURCE_DIR"/*.md; do
  name="$(basename "$f")"
  cp "$f" "$TARGET_DIR/$name"
  echo "  ✅ $name"
  COUNT=$((COUNT + 1))
done

echo ""
echo "🎉 완료! ${COUNT}개 커맨드 설치됨"
echo ""
echo "다음 단계:"
echo "  1. claude 실행"
echo "  2. 프로젝트에서 /memory-init 실행"
echo ""
echo "커맨드 목록:"
echo "  /memory-init   - Memory 시스템 초기화"
echo "  /memory-save   - 학습 저장"
echo "  /memory-list   - 목록 조회"
echo "  /memory-review - 정리 리뷰"
