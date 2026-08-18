# TABÁ — site em Next.js + TypeScript + React Three Fiber

Portfólio/conversão para a TABÁ (marca, SaaS, landing pages, desenvolvimento).

## Rodando localmente

```bash
npm install
npm run dev
```

Abra http://localhost:3000

## Build de produção

```bash
npm run build
npm start
```

## Estrutura

```
app/
  layout.tsx        # fontes (Space Grotesk + Manrope), metadata/SEO
  page.tsx           # monta as seções, carrega a Lagoon sem SSR
  globals.css
components/
  Lagoon.tsx          # canvas WebGL, detecção de suporte, fallback CSS
  LagoonScene.tsx      # mesh + shader + câmera reativa ao scroll
  shaders/
    lagoonVertex.ts
    lagoonFragment.ts
  Nav.tsx
  Hero.tsx
  Manifesto.tsx
  Services.tsx        # lista de serviços (branding, SaaS, landing pages, dev...)
  Projects.tsx         # cases fictícios — substitua pelos projetos reais
  Differentiator.tsx
  Process.tsx
  About.tsx
  CTAFinal.tsx
  Contact.tsx           # formulário — plugue seu endpoint/API route em handleSubmit
  Footer.tsx
  Reveal.tsx            # wrapper de scroll-reveal reutilizável
```

## Onde editar conteúdo

- **Projetos reais**: `components/Projects.tsx`, array `projects`.
- **Serviços**: `components/Services.tsx`, array `services`.
- **Textos do hero/manifesto/sobre**: direto nos respectivos componentes.
- **Contato**: `components/Contact.tsx` — o `handleSubmit` está pronto para
  receber sua integração (API route, Resend, Formspree, etc.); troque o
  número do WhatsApp em `Contact.tsx` e `Footer.tsx`.

## Deploy

Funciona out-of-the-box na Vercel ou Netlify (Next.js App Router).
Único ponto de atenção: o Canvas 3D (`Lagoon.tsx`) é carregado via
`dynamic(..., { ssr: false })` porque WebGL não existe no servidor —
não remova essa flag.

## Performance

- Geometria da laguna reduz de 140×140 para 64×64 segmentos em telas
  < 620px.
- `dpr` do canvas limitado a 1.5–2 dependendo do dispositivo.
- Fallback em CSS puro (gradiente animado) quando WebGL não está disponível.
- Respeita `prefers-reduced-motion` nas animações GSAP e CSS.
