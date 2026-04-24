# memory-system

Claude Code를 위한 **Markdown 기반 auto memory 시스템**. 프로젝트 세션이 끝나도 지식이 축적되도록 `user / feedback / project / reference` 4가지 타입으로 분류하여 체계적으로 기록합니다.

## 🎯 해결하는 문제

Claude Code 장기 프로젝트에서 매번 겪는 "지난 세션에서 알아낸 내용이 이어지지 않는" 문제를 해결합니다.

## ✨ 제공 커맨드

| 커맨드 | 설명 |
|--------|------|
| `/memory-init` | 현재 프로젝트에 memory 시스템 디렉터리·파일 구조 초기화 |
| `/memory-save` | 세션 중 얻은 학습을 적절한 타입으로 분류해 저장 |
| `/memory-list` | 현재 저장된 모든 memory 요약 조회 |
| `/memory-review` | 오래되거나 중복된 memory를 검토·정리 |

## 📂 생성되는 구조

```
project-root/
├── CLAUDE.md                 # 메인 지시서 (Memory System 섹션 자동 추가)
└── memory/
    ├── MEMORY.md             # 인덱스
    ├── _templates/           # 4가지 타입 템플릿
    │   ├── user.md
    │   ├── feedback.md
    │   ├── project.md
    │   └── reference.md
    ├── user_role.md
    ├── feedback_*.md
    ├── project_*.md
    └── reference_*.md
```

## 🔑 4가지 메모리 타입

### 👤 user — 사용자 맥락
직책, 스킬 레벨, 커뮤니케이션 선호 등. Claude가 설명 톤을 맞추는 데 사용합니다.

### 💡 feedback — 과거 학습한 행동 규칙
**반드시 `Why + How to apply` 두 필드를 포함**합니다. 이유가 있어야 Claude가 엣지 케이스를 판단할 수 있습니다.

### 📌 project — 프로젝트 동적 상태
**날짜를 반드시 절대 표기 + KST 명시**합니다. "다음 주" 같은 상대 표현 금지. 2주마다 `/memory-review`로 재확인하세요.

### 🔗 reference — 외부 리소스 포인터
Jira, Notion, 내부 문서 URL 등. Claude가 필요할 때 참조하도록 한 줄 용도 설명을 함께 기록합니다.

## 🚀 사용 흐름

```bash
# 1. 프로젝트에서 Claude Code 실행
cd /your/project
claude

# 2. 최초 초기화
> /memory-init

# 3. 본인 맥락 저장
> /memory-save 저는 스타트업 CTO이고 Go 10년차입니다. React는 이번 달부터 써요.

# 4. 세션 중 학습 저장
> /memory-save 통합 테스트에서 DB를 mock하지 말고 testcontainers로 실제 Postgres를 띄워야 함. 지난 분기 mock 테스트는 그린인데 운영 마이그레이션이 깨진 사례가 있었음.

# 5. 현재 memory 확인
> /memory-list

# 6. 주기적 정리 (2주~1개월마다)
> /memory-review
```

## 🇰🇷 한국 개발 환경 권장 운용

### 보안
- `memory/` 디렉터리에 **API 키, 고객 PII, 내부 시스템 URL** 을 저장하지 마세요
- ISMS-P / 금융권 프로젝트는 `memory/` 전체를 `.gitignore`에 추가하고 로컬에서만 관리
- 사내 DLP(Data Loss Prevention) 정책과 충돌 여부를 먼저 확인

### 팀 공유
- `memory/team/` (Git 포함) + `memory/personal/` (gitignore 추가) 구조 권장
- `/memory-save` 시 공유할지 개인 메모로 남길지 명시적으로 결정

### 날짜
- 모든 날짜는 `YYYY-MM-DD KST` 형식으로 통일
- 해외 협업 시 UTC 병기 권장

## ⚠️ 저장하지 말 것

| 저장 ❌ | 이유 |
|--------|------|
| 코드에서 파생 가능한 사실 | 코드 자체가 진실의 원천 |
| git log로 추적되는 변경사항 | git 히스토리가 있음 |
| 일회성 버그 수정 내역 | PR/이슈 트래커로 충분 |
| 회의록 원문 | rationale만 추출해서 저장 |

## 💡 설계 철학

1. **CLAUDE.md는 불변**. 자주 바뀌는 건 여기 두지 않는다
2. **memory/는 학습 축적**. 서브파일로 분리해서 필요할 때만 Read
3. **인덱스와 본문 분리**. MEMORY.md는 링크만, 본문은 서브파일
4. **Why + How to apply 강제**. 이유 없는 규칙은 쓸모없다
5. **memory는 썩는다**. 주기적으로 `/memory-review`

## 📄 라이선스

MIT

## 👤 제작자

**gaebalai** — AI 멘탈리스트 · Claude Code 한국어 교육 콘텐츠 크리에이터

원문 아이디어 출처는 프로젝트 문서를 참조하세요.
