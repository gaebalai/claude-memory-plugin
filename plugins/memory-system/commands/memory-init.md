---
description: 현재 프로젝트에 Markdown 기반 Memory 시스템을 초기화합니다
---

# Memory System 초기화

현재 작업 디렉터리에 auto memory 시스템을 구축합니다.

## 실행 순서

### 1. 디렉터리 생성
다음 디렉터리를 생성합니다 (이미 존재하면 스킵):
- `.claude/rules/`
- `.claude/skills/`
- `memory/`
- `memory/_templates/`

### 2. CLAUDE.md 업데이트

`CLAUDE.md`가 없으면 새로 생성하고, 있으면 기존 내용 끝에 아래 섹션을 **추가**하세요 (중복 방지를 위해 `## Memory System` 헤더가 이미 있으면 스킵):

```markdown
## Memory System

이 프로젝트는 Markdown 기반 auto memory 시스템을 사용합니다.

### 읽기 규칙
- 세션 시작 시 `memory/MEMORY.md`를 **반드시 먼저 Read**로 읽는다
- 인덱스에서 관련 있는 서브파일만 선택적으로 Read
- 모든 본문 파일을 한꺼번에 읽지 말 것 (context 낭비)

### 쓰기 규칙
- 새로운 학습이 생기면 적절한 타입으로 `memory/`에 저장
- 4가지 타입: `user` / `feedback` / `project` / `reference`
- `feedback`과 `project` 타입은 반드시 **Why + How to apply** 포함
- 날짜는 **절대 날짜 + KST** 명시 (예: `2026-04-24 KST`)
- 코드에서 derivable 하거나 git log로 추적 가능한 사실은 저장하지 않음
```

### 3. memory/MEMORY.md (인덱스) 생성

기존에 없을 때만 생성하세요:

```markdown
# Memory Index

> 이 파일은 인덱스입니다. 본문은 서브파일에 있습니다.
> 관련 항목만 Read로 불러와 주세요.

## 프로젝트 개요
- **이름**: (프로젝트명)
- **목적**: (한 줄 요약)
- **주요 스택**: (언어/프레임워크)

## 기술 메모
<!-- feedback_*.md, project_*.md 등 서브파일 링크를 여기에 추가 -->

## 사용자
- [user_role.md](user_role.md)

## 외부 리소스
<!-- reference_*.md 서브파일 링크 -->
```

### 4. 4가지 타입 템플릿 생성 (`memory/_templates/`)

플러그인에 포함된 템플릿 파일들을 복사합니다. 플러그인 경로의 `templates/` 디렉터리에서 다음 파일들을 `memory/_templates/`로 복사하세요:

- `user.md`
- `feedback.md`
- `project.md`
- `reference.md`

플러그인 templates 디렉터리를 찾을 수 없다면, 아래 내용으로 각 템플릿을 직접 생성하세요:

**`memory/_templates/user.md`**:
```markdown
---
name: (역할/이름)
type: user
description: (한 줄 요약)
---

- (경력/직책)
- (주요 기술 스킬)
- (커뮤니케이션 선호: 예. "Go 관례와 비교해서 설명하면 이해가 빠름")
```

**`memory/_templates/feedback.md`**:
```markdown
---
name: (규칙 이름)
type: feedback
description: (한 줄 요약)
---

**규칙**: (지켜야 할 행동)

**Why**: (이 규칙이 생긴 배경·사례)
**How to apply**: (어떤 상황에서 어떻게 적용할지 구체적으로)
```

**`memory/_templates/project.md`**:
```markdown
---
name: (상태 이름)
type: project
description: (한 줄 요약)
---

**사실**: (무엇이 언제부터 - YYYY-MM-DD KST)

**Why**: (왜 이 상태가 되었는지)
**How to apply**: (이 상태일 때 어떻게 행동해야 하는지)
**유효 기한**: (있다면 YYYY-MM-DD KST, 없으면 "재확인 필요")
```

**`memory/_templates/reference.md`**:
```markdown
---
name: (리소스 이름)
type: reference
description: (한 줄 요약)
---

도구/프로젝트: `(이름)`
- URL: (링크)
- 용도: (언제 이것을 참조할지)
```

### 5. .gitignore 확인

`.gitignore`에 다음이 없으면 추가 여부를 사용자에게 물어보세요:
```
# Memory (개인 메모는 공유하지 않음)
memory/personal/
```

### 6. 완료 리포트

마지막에 다음을 출력하세요:

1. 생성된 파일 트리 (실제 `tree memory/ .claude/` 결과 또는 유사한 형식)
2. **다음 단계 안내**:
   - `/memory-save "내용"` 으로 학습 저장
   - `/memory-list` 로 현재 memory 확인
   - `/memory-review` 로 오래된 memory 정리
3. **사용자가 먼저 채워야 할 항목**:
   - `memory/user_role.md` 생성 (템플릿 복사 후 내용 입력)
   - `MEMORY.md`의 "프로젝트 개요" 섹션

## 주의사항
- 기존 파일을 덮어쓰지 말 것. 반드시 존재 여부를 먼저 확인
- Git 저장소라면 커밋 전에 사용자 승인 받기
- Windows/WSL2 환경에서는 경로 구분자 주의
