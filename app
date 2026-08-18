@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --ease: cubic-bezier(0.16, 0.84, 0.44, 1);
}

* {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  background: #05100f;
  color: #eae6da;
}

::selection {
  background: #7fe7c4;
  color: #030b0a;
}

.eyebrow {
  font-family: var(--font-display);
  font-size: 12px;
  letter-spacing: 0.24em;
  text-transform: uppercase;
  color: #7fe7c4;
  display: flex;
  align-items: center;
  gap: 10px;
}
.eyebrow::before {
  content: "";
  width: 22px;
  height: 1px;
  background: #7fe7c4;
}

.reveal {
  opacity: 0;
  transform: translateY(28px);
  transition: opacity 1s var(--ease), transform 1s var(--ease);
}
.reveal.in {
  opacity: 1;
  transform: translateY(0);
}

@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

@keyframes ripple {
  0% {
    transform: scale(0.3);
    opacity: 0.9;
  }
  100% {
    transform: scale(2.6);
    opacity: 0;
  }
}
.ripple-ring {
  animation: ripple 5s ease-out infinite;
}

@keyframes cueMove {
  0%,
  100% {
    opacity: 0.3;
  }
  50% {
    opacity: 1;
  }
}
.scroll-cue-line {
  animation: cueMove 2.4s ease-in-out infinite;
}

import type { Metadata } from "next";
import { Space_Grotesk, Manrope } from "next/font/google";
import "./globals.css";

const spaceGrotesk = Space_Grotesk({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-display",
  display: "swap",
});

const manrope = Manrope({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600"],
  variable: "--font-body",
  display: "swap",
});

export const metadata: Metadata = {
  title: "TABÁ — Estúdio de marca, produto e conversão digital",
  description:
    "TABÁ é um estúdio de marca, produtos SaaS, landing pages e desenvolvimento web, nascido em São Pedro da Aldeia, Região dos Lagos.",
  keywords: [
    "TABÁ",
    "design São Pedro da Aldeia",
    "branding Região dos Lagos",
    "desenvolvimento SaaS",
    "landing page de conversão",
    "desenvolvimento web Rio de Janeiro",
  ],
  openGraph: {
    title: "TABÁ — Onde ideias diferentes encontram terra firme",
    description:
      "Estúdio de marca, produtos SaaS, landing pages e experiências digitais nascido na Região dos Lagos, RJ.",
    type: "website",
  },
  icons: {
    icon:
      "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='6' fill='%23071A19'/%3E%3Cpath d='M4 20 Q10 14 16 20 T28 20' stroke='%237FE7C4' stroke-width='2' fill='none'/%3E%3C/svg%3E",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="pt-BR" className={`${spaceGrotesk.variable} ${manrope.variable}`}>
      <body className="font-body font-light antialiased">{children}</body>
    </html>
  );
}

import dynamic from "next/dynamic";
import Nav from "@/components/Nav";
import Hero from "@/components/Hero";
import Manifesto from "@/components/Manifesto";
import Services from "@/components/Services";
import Projects from "@/components/Projects";
import Differentiator from "@/components/Differentiator";
import Process from "@/components/Process";
import About from "@/components/About";
import CTAFinal from "@/components/CTAFinal";
import Contact from "@/components/Contact";
import Footer from "@/components/Footer";

// WebGL/Canvas can only run in the browser, so the lagoon is loaded
// client-side only. This avoids hydration mismatches and keeps the
// server render fast and lightweight.
const Lagoon = dynamic(() => import("@/components/Lagoon"), {
  ssr: false,
});

export default function Home() {
  return (
    <>
      <Nav />

      <div className="fixed inset-0 z-0 h-screen w-screen">
        <Lagoon />
      </div>

      <Hero />

      <main className="relative z-[2] border-t border-white/10 bg-bg">
        <Manifesto />
        <Services />
        <Projects />
        <Differentiator />
        <Process />
        <About />
        <CTAFinal />
        <Contact />
        <Footer />
      </main>
    </>
  );
}
