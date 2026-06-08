# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 프로젝트 개요

개인용 할일 관리 웹서비스. 로그인 없이 Supabase를 직접 호출하는 단일 HTML 파일 앱.

## 개발 & 배포

**로컬 미리보기**: 별도 빌드 없음. `public/index.html`을 브라우저에서 직접 열거나 간단한 HTTP 서버 사용.
```
npx serve public
# 또는
python -m http.server 8080 --directory public
```

**배포**: `main` 브랜치에 push하면 `.github/workflows/static.yml`이 자동으로 GitHub Pages에 배포.
배포 대상 경로는 레포 루트 전체(`path: '.'`).

## Supabase 설정

`public/config.js`에 아래 두 변수를 설정해야 앱이 동작함:
```js
const SUPABASE_URL = 'https://xxxx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...';
```

초기 DB 스키마는 `supabase/schema.sql`을 Supabase SQL Editor에서 실행. RLS는 개인용 앱이므로 비활성화되어 있음.

## 아키텍처

- **`public/index.html`**: 앱 전체 로직 포함 (HTML + CSS + JS 단일 파일)
  - Tailwind CSS CDN, Supabase JS CDN을 `<script>`로 로드
  - 전역 `db` (Supabase 클라이언트), `cache` (Map, id→todo) 상태 유지
  - `loadTodos()` 호출 후 `renderList()` → `todoHTML()` 로 DOM 재생성 방식
  - 이벤트는 `#todo-list`에 위임(event delegation), `data-action` 속성으로 분기
  - `esc()` 유틸로 XSS 방지 (innerHTML에 삽입 전 textContent 경유 이스케이프)
- **`public/config.js`**: Supabase 접속 정보 (URL, anon key)
- **`functions/`**: 현재 미사용. 향후 서버사이드 확장 시 Supabase Edge Functions 또는 Cloudflare Pages Functions 고려
- **`designs/todo.xml`**: XML 형식의 화면 설계 참고 파일

## 디자인 규칙 (토스 스타일)

| 용도 | 값 |
|------|-----|
| 배경 | `#F2F4F6` |
| 카드 배경 | `#FFFFFF`, `border-radius: 16px`, `box-shadow: 0 2px 10px rgba(0,0,0,0.06)` |
| 주요 텍스트 | `#191F28` |
| 보조 텍스트 | `#6B7684` |
| 비활성/플레이스홀더 | `#B0B8C1` |
| 포인트 컬러(파랑) | `#3182F6` |
| 위험 컬러(빨강) | `#F04452` |
| 폰트 | `-apple-system`, `Pretendard`, `Noto Sans KR` 순 |
| 입력 테두리 포커스 | `#3182F6` |
