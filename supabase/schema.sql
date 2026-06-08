-- =====================================================
-- myTODO — Supabase 초기 스키마
-- =====================================================
-- Supabase 대시보드 → SQL Editor 에서 실행하세요.
-- =====================================================

-- todos 테이블 생성
create table if not exists todos (
  id          uuid        primary key default gen_random_uuid(),
  task        text        not null,
  completed   boolean     not null default false,
  created_at  timestamptz not null default now()
);

-- 개인용 앱 — RLS 비활성화 (anon key 로 전체 접근 허용)
alter table todos disable row level security;
