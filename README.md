# Análise de Fraude em Cartão de Crédito — SQL

## Sobre o projeto

Projeto de análise de dados de transações de varejo com foco em identificação de padrões de fraude.
Utiliza SQL (MySQL) para criar tabelas, importar dados, escrever queries analíticas e gerar views com os principais indicadores.

## Ferramentas
- MySQL / MySQL Workbench
- SQL (DDL + DML + Views)

## O que foi feito

- Importação e modelagem de datasets de clientes, pedidos e produtos
- Identificação de transações suspeitas com base em horário, valor e padrão de compra
- Criação de views para os principais indicadores:
  - Taxa média de fraude
  - Horários com maior incidência de fraude
  - Transações por faixa de valor (alto × baixo)
  - Fraudes × transações normais
- Análise complementar com dataset Superstore Sales

## Estrutura

```
01_fraude_cartao_sql/
├── data/               → datasets brutos (CSV e XLSX)
│   ├── customers.csv
│   ├── orders.csv
│   ├── products.csv
│   ├── dataset_varejo.csv / .xlsx
│   └── superstore_sales.csv
├── queries/            → scripts SQL em ordem de execução
│   ├── 01_fraude_cartao.sql
│   ├── 02_continuacao_parte1.sql
│   ├── 03_continuacao_fraude.sql
│   ├── 04_importacao.sql
│   └── 05_query_importacao_tabela.sql
├── views/              → resultados exportados das views
│   ├── horarios_fraude.csv
│   ├── taxa_media_fraude.csv
│   ├── transacoes_altovalor_baixovalor.csv
│   ├── transacoes_fraudes_normais.csv
│   └── vw_*.csv
└── outputs/            → espaço para futuros relatórios e dashboards
```

## Como reproduzir

1. Abra o MySQL Workbench e crie um novo schema
2. Execute os scripts da pasta `queries/` em ordem numérica
3. Os scripts de importação criam as tabelas e carregam os CSVs da pasta `data/`
4. As views ficam disponíveis para consulta no schema

## Aprendizados

- Modelagem relacional com múltiplas tabelas
- Uso de `JOIN`, `GROUP BY`, `HAVING` e `WHERE` para filtros analíticos
- Criação de `VIEW` para reaproveitar consultas complexas
- Exportação de resultados para CSV

## Fonte dos dados

Dataset sintético de varejo (Realistic Multi-Causal Retail Dataset) e Superstore Sales — públicos, para fins de estudo.
