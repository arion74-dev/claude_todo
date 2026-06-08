# myTODO

개인용 할 일 관리 웹서비스 — Toss 디자인 스타일

## 배포 전 설정

### 1. Supabase 프로젝트 생성

1. [supabase.com](https://supabase.com) 에서 새 프로젝트 생성
2. **SQL Editor** 에서 `supabase/schema.sql` 내용 실행
3. **Settings → API** 에서 아래 두 값 복사:
   - Project URL
   - anon / public key

### 2. config.js 수정

`public/config.js` 파일을 열어 복사한 값을 입력합니다:

```js
const SUPABASE_URL = 'https://xxxx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...';
```

### 3. GitHub 저장소 설정

1. GitHub 에 새 저장소 생성 후 푸시:
   ```bash
   git init
   git add .
   git commit -m "init: myTODO app"
   git remote add origin https://github.com/<user>/<repo>.git
   git push -u origin main
   ```

2. 저장소 **Settings → Pages** 이동
3. **Source**: `GitHub Actions` 선택

### 4. 배포 확인

`main` 브랜치에 push 하면 GitHub Actions 가 자동으로 배포합니다.
배포 URL: `https://<user>.github.io/<repo>/`

## 기술 스택

| 영역 | 기술 |
|------|------|
| 프론트엔드 | HTML · CSS · JavaScript · Tailwind CSS CDN |
| 데이터베이스 | Supabase (PostgreSQL) |
| 배포 | GitHub Pages + GitHub Actions |

## 기능

- 할 일 추가 (Enter 키 지원)
- 할 일 수정 (인라인 편집, Enter/Escape 키 지원)
- 할 일 삭제
- 완료 체크 (토글)
- 남은 할 일 개수 표시
