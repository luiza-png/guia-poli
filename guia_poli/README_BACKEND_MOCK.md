# Backend inicial do GUIA POLI — dados fictícios

Este pacote implementa somente as funcionalidades dos cinco cards da Home.
A barra de pesquisa não possui backend nesta etapa.

## Funcionalidades

- Redes & Conexão -> `/redes/`
- Sistemas acadêmicos -> `/sistemas/`
- Canais de comunicação -> `/comunicacao/`
- Suporte Técnico (DTI) -> `/suporte/`
- Mapa do campus -> `/mapa/`

## Dados de teste

Os dados estão em `faq/data.py`. Eles simulam o que futuramente virá do banco de dados.

Quando o banco real estiver pronto, a ideia é substituir as listas/dicionários de `data.py` por consultas via Django ORM, mantendo as URLs e os templates o mais estáveis possível.

## Configuração

Não esquecer de adicionar `faq` e `polimap` em `INSTALLED_APPS` no `guia_poli/settings.py`:

```python
'faq',
'polimap',
```

## Teste

Na pasta que contém `manage.py`:

```powershell
python manage.py check
python manage.py runserver
```

Depois abra:

- `http://127.0.0.1:8000/`
- `http://127.0.0.1:8000/redes/`
- `http://127.0.0.1:8000/sistemas/`
- `http://127.0.0.1:8000/comunicacao/`
- `http://127.0.0.1:8000/suporte/`
- `http://127.0.0.1:8000/mapa/`
