---
description: 현재 세션의 학습을 적절한 memory 타입으로 저장합니다
argument-hint: [저장할 내용 또는 타입 힌트]
---

# Memory 저장

다음 내용을 읽고 가장 적합한 memory 타입으로 분류하여 저장합니다:

**내용**: $ARGUMENTS

## 분류 기준

| 타입 | 언제 사용 | 파일명 규칙 | 필수 필드 |
|------|-----------|-------------|-----------|
| `user` | 사용자 선호·스킬·직책 | `user_*.md` | name, type, description |
| `feedback` | 과거 지적받거나 배운 행동 규칙 | `feedback_*.md` | **Why + How to apply 필수** |
| `project` | 프로젝트의 동적 상태 | `project_*.md` | **날짜 (YYYY-MM-DD KST)** |
| `reference` | 외부 리소스 포인터 | `reference_*.md` | URL, 용도 |

## 실행 순서

### 1. 분류
입력 내용을 읽고 위 4가지 중 어디에 해당하는지 판단합니다.
애매하면 사용자에게 확인하세요. 복수 타입이면 각각 별도 파일로 분리합니다.

### 2. 파일명 제안
- 소문자 + 언더스코어
- 핵심 키워드 2~4개
- 예시: `feedback_use_testcontainers.md`, `project_mobile_freeze_2026q1.md`

### 3. frontmatter + 본문 작성

기본 템플릿:
```markdown
---
name: (한 줄 제목)
type: (분류한 타입)
description: (한 줄 요약)
---

(본문)
```

타입별 추가 요구사항:
- **feedback** → `**Why**:` 와 `**How to apply**:` 두 줄 **반드시** 포함
- **project** → `**사실**:` 에 `YYYY-MM-DD KST` 형식 절대 날짜 포함
- **user** → 불릿 리스트로 간결하게
- **reference** → URL과 "언제 참조하는가" 명시

### 4. 인덱스 업데이트

`memory/MEMORY.md`의 해당 섹션에 링크를 추가합니다:
- `user` → `## 사용자` 섹션
- `feedback` → `## 기술 메모` 섹션
- `project` → `## 기술 메모` 섹션 (진행 중인 것만)
- `reference` → `## 외부 리소스` 섹션

링크 형식: `- [파일명.md](파일명.md) 한 줄 요약`

### 5. 저장 전 확인

저장하기 전에 다음을 사용자에게 보여주고 **승인을 받으세요**:
1. 제안된 파일 경로
2. 작성된 frontmatter + 본문 전체
3. MEMORY.md에 추가될 한 줄

사용자가 "OK" 또는 "저장해줘" 등으로 승인하면 실제로 Write합니다.

## 저장 금지 규칙

다음은 저장하지 마세요 (사용자에게 안내 후 스킵):
- 코드에서 derivable 한 사실 (예: "함수 이름은 xxx")
- git log/PR로 추적 가능한 변경사항
- 일회성 정보 (이미 해결된 버그 등)
- 민감 정보 (API 키, PII, 내부 URL 등)

민감 정보가 의심되면 경고하고 저장을 **중단**하세요.

## 특수 케이스

- `memory/` 디렉터리가 없으면 → `/memory-init` 실행을 권유
- 동일 파일명이 이미 있으면 → 덮어쓸지, append할지, 다른 이름으로 할지 사용자에게 선택받기
- 내용이 너무 짧거나 모호하면 → "더 구체적으로 적어달라"고 되묻기
