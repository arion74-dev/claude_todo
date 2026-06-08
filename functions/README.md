# functions/

이 디렉토리는 향후 서버사이드 기능 확장을 위한 공간입니다.

현재 myTODO는 **Supabase JS 클라이언트를 브라우저에서 직접 호출**하는 방식으로 동작하므로,
별도의 서버사이드 함수가 필요하지 않습니다.

---

확장이 필요할 경우 아래 옵션을 고려하세요:

- **Supabase Edge Functions** — Supabase 내에서 Deno 기반 함수 실행
- **Cloudflare Pages Functions** — GitHub Pages → Cloudflare Pages 로 전환 시
- **Netlify Functions** — GitHub Pages → Netlify 로 전환 시
