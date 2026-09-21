#!/bin/sh
# Envia um lead de teste ao webhook do Make com o mesmo formato que a página de captura usa.
curl -s -X POST "https://hook.us2.make.com/5itm6cg6i89rjtk9mogmbhv1qg2m1loh" \
  -H "Content-Type: application/json" -w "\nHTTP %{http_code}\n" -d '{
  "name": "Teste Claude Lead", "first_name": "Teste", "last_name": "Claude Lead",
  "email": "teste.lead@exemplo.com",
  "phone": "48999990000", "phone_e164": "+5548999990000",
  "patrimonio": "5mi-10mi", "patrimonio_label": "De R$ 5 a R$ 10 milhões", "qualificado": true, "status_qualificacao": "qualificado",
  "utm_source": "facebook", "utm_medium": "cpc", "utm_campaign": "mpp-teste",
  "utm_term": "holding", "utm_content": "criativo-01", "utm_id": "",
  "fbclid": "TESTE_FBCLID_123", "gclid": "", "ttclid": "", "src": "", "sck": "",
  "landing_url": "https://luizgarcez.com.br/mpp-captura/?utm_source=facebook&utm_medium=cpc&utm_campaign=mpp-teste&utm_term=holding&utm_content=criativo-01&fbclid=TESTE_FBCLID_123",
  "referrer": "https://l.facebook.com/",
  "page_url": "https://luizgarcez.com.br/mpp-captura/?utm_source=facebook&utm_medium=cpc&utm_campaign=mpp-teste",
  "page_id": "mpp-captura", "cta_id": "hero",
  "event_id": "teste-0001", "submitted_at": "2026-09-21T18:00:00.000Z",
  "user_agent": "curl-teste"
}'
