# gaebalai-marketplace

Claude Code 생산성을 높이는 플러그인 마켓플레이스.

## 📦 포함 플러그인

### memory-system
Markdown 기반 auto memory 시스템. 프로젝트 세션 간 지식을 영구 축적합니다.

4가지 메모리 타입(`user`/`feedback`/`project`/`reference`)과 4가지 슬래시 커맨드(`/memory-init`, `/memory-save`, `/memory-list`, `/memory-review`)를 제공합니다.

→ [상세 문서](./plugins/memory-system/README.md)

## 🚀 설치 방법

### 방법 1: GitHub에서 직접 설치 (배포 후)

```bash
# Claude Code 실행
claude

# 마켓플레이스 추가
/plugin marketplace add gaebalai/claude-memory-plugin

# 플러그인 설치
/plugin install memory-system@gaebalai-marketplace
```

### 방법 2: 로컬에서 테스트

```bash
# 이 저장소를 클론
git clone https://github.com/gaebalai/claude-memory-plugin.git
cd claude-memory-plugin

# Claude Code에서 로컬 마켓플레이스로 추가
claude
> /plugin marketplace add .
> /plugin install memory-system@gaebalai-marketplace
```

### 방법 3: 슬래시 커맨드만 개별 설치 (플러그인 없이)

플러그인 시스템을 쓰지 않고 커맨드 파일만 쓰고 싶다면:

```bash
# 전역 커맨드 디렉터리 생성
mkdir -p ~/.claude/commands

# 커맨드 파일 복사
cp plugins/memory-system/commands/*.md ~/.claude/commands/
```

이후 어느 프로젝트에서든 `claude` 실행 후 `/memory-init` 등을 바로 사용할 수 있습니다.

## 🗂️ 저장소 구조

```
gaebalai-marketplace/
├── .claude-plugin/
│   └── marketplace.json       # 마켓플레이스 매니페스트
├── plugins/
│   └── memory-system/
│       ├── .claude-plugin/
│       │   └── plugin.json    # 플러그인 매니페스트
│       ├── commands/          # 슬래시 커맨드 4개
│       │   ├── memory-init.md
│       │   ├── memory-save.md
│       │   ├── memory-list.md
│       │   └── memory-review.md
│       ├── templates/         # 메모리 타입 템플릿 4개
│       │   ├── user.md
│       │   ├── feedback.md
│       │   ├── project.md
│       │   └── reference.md
│       └── README.md
└── README.md                  # (이 파일)
```

## 🔄 업데이트

```bash
/plugin marketplace update gaebalai-marketplace
```

## 📝 라이선스

MIT

## 🙌 기여

버그 리포트나 기능 제안은 GitHub Issues로 보내주세요.

## 👤 제작자

**gaebalai**

- AI 멘탈리스트
- Claude Code 한국어 교육 콘텐츠 크리에이터
- Velog 블로그: https://velog.io/@aiengineer
- Naver 블로그: https://blog.naver.com/beyond-zero
