# Luiz Garcez — Funil MPP (Captura → Obrigado)

Estrutura pronta para publicar, baseada nas páginas atuais em luizgarcez.com.br (mpp-07/08/12/13).

```
Garcez/
├── assets/            # logo, depoimentos e fundos (hero.webp, quem-sou.webp, secao-02.webp + versões mobile)
├── captura/index.html # página de captura — mesma estrutura das páginas atuais
├── captura-v2/index.html # página de captura — estrutura do modelo "Revolução" (metodoagendacheia.com) com identidade Garcez
└── obrigado/index.html# página de obrigado — 1 botão → grupo do WhatsApp (link do XPzap)
```

## Fluxo

1. Visitante clica em qualquer CTA → abre o modal com Nome, E-mail, WhatsApp.
2. Submit faz POST JSON no webhook do Make (obrigatório) com nome, e-mail, telefone, patrimônio (`patrimonio`, `patrimonio_label`, `qualificado` true/false, `status_qualificacao`), UTMs, fbclid/gclid, landing_url, referrer, page_id e cta_id. Pixel dispara `Lead` + `CompleteRegistration`; tracker CAPI é opcional.
   UTMs são capturadas na primeira visita e guardadas 30 dias no navegador (first-touch), então chegam mesmo se o lead voltar sem parâmetros.
   Para testar o webhook: `./teste-webhook.sh` (o cenário no Make precisa estar ligado ou em modo de escuta).
3. Sucesso → redireciona para `obrigado/` preservando a query string (UTMs).
4. Obrigado: único botão verde → `GROUP_URL` do XPzap. UTMs são anexadas ao link.

## O que configurar antes de publicar

| Onde | Chave | Valor |
|---|---|---|
| `captura/index.html` (topo) | `WEBHOOK_URL` | webhook do Make que recebe todo formulário (já preenchido) |
| `captura/index.html` (topo) | `TRACKER_URL` | endpoint do tracker Meta CAPI/GA4 (opcional, vazio = desligado) |
| `captura/index.html` (topo) | `PAGE_ID` | nome da variação, vai no campo `page_id` do payload |
| `captura/index.html` (topo) | `OBRIGADO_URL` | caminho da página de obrigado |
| `captura/index.html` | `G-XXXXXXXXXX` | ID do GA4 (está placeholder nas páginas atuais também) |
| `obrigado/index.html` (topo) | `GROUP_URL` | **link de redirect do XPzap** |
| `obrigado/index.html` (topo) | `TRACKER_URL` | mesmo endpoint da captura, ou `''` |

## Variações de headline já usadas (hero H1 + subtítulo)

- **mpp-07** — "Proteja e potencialize seu patrimônio da Reforma Tributária!"
- **mpp-08** — "Acabou a sonegação de imóveis em 2026." (Receita cruza dados com IA)
- **mpp-12** — "Sua família pode perder até 40% no inventário."
- **mpp-13** — "Seus filhos podem herdar sem pagar uma fortuna de imposto."

Para criar nova variação: duplicar `captura/`, trocar só o bloco `<h1>` + `.hero-sub` e o `TRACKER_URL`.

## Fotos do Luiz

As fotos do Luiz já estão nos fundos do hero (`assets/hero.webp`) e da seção "Quem é o Dr. Luiz Garcez?"
(`assets/quem-sou.webp`), idênticos ao site atual. A pasta do Drive não era acessível; se quiser trocar a foto,
basta substituir esses arquivos mantendo o nome.

## Copy da captura-v2

Segue o Google Doc "Versão 01" (O fim do patrimônio no CPF). Variação de headline reservada no doc, ainda não usada:
"Como transferir seu patrimônio para seus filhos sem passar pelo inventário e sem perder até 43% do que você levou a vida inteira para construir."

## Pendências / decisões

- Data do evento no hero e nos cards de dia ("11, 12 e 13 | AGOSTO") está herdada; ajustar para a próxima turma.
- A página de obrigado atual do site tem redirect automático em 10s + botão de suporte. A nova versão é
  propositalmente simples (só o botão), conforme pedido; se quiser o redirect automático de volta, avisar.
