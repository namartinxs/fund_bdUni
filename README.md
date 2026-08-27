# 🗄️ fund_bdUni — Fundamentos de Banco de Dados

Repositório com exercícios, listas e scripts SQL desenvolvidos ao longo da disciplina de **Fundamentos de Banco de Dados** na faculdade. Diferente de um projeto único, este repositório funciona como um **caderno de estudos**: reúne as práticas feitas em cada aula, cobrindo desde a criação de tabelas até consultas mais elaboradas com `JOIN`, `GROUP BY` e subconsultas.

> 📚 Repositório de estudos da disciplina de Fundamentos de Banco de Dados.

---

## 📖 Sobre o repositório

Cada pasta/arquivo corresponde a uma aula, lista de exercícios ou tema estudado, geralmente contemplando as três etapas clássicas de manipulação em SQL:

- **DDL** (Data Definition Language) — criação de bancos e tabelas.
- **DML** (Data Manipulation Language) — inserção e atualização de dados.
- **DQL** (Data Query Language) — consultas e extração de informações.

---

## 🗂️ Estrutura do repositório

```
fund_bdUni/
├── DDL LISTA1/          # Criação das tabelas da Lista 1
├── DML_LISTA1/          # Inserção de dados da Lista 1
├── DQL LISTA1/          # Consultas da Lista 1
├── GA/                  # Exercícios/atividade do Grupo A
├── GB/TGB/              # Exercícios/atividade do Grupo B
├── SCRIPTS/             # Scripts auxiliares diversos
├── l9.sql               # Exercícios da Lista 9
├── lista8.sql           # Exercícios da Lista 8 (peças, fornecedores e embalagens)
├── sqlAula09.09.sql     # Prática da aula do dia 09/09
├── sqlAula09.09pt3.sql  # Continuação da prática do dia 09/09
├── sqlPT2.sql           # Prática adicional (parte 2)
└── sqlTemaAula4.sql     # Prática da aula 4
```

> 💡 Os nomes dos arquivos seguem a nomenclatura usada em sala de aula (por data, número da lista ou tema), então nem todos seguem um padrão único.

---

## 🔍 Exemplo de conteúdo — Lista 8

Como amostra do que é abordado no repositório, a `lista8.sql` modela o clássico exemplo acadêmico de **peças, fornecedores e embarques**:

- **Peca** — peças com código, nome, cor, peso e cidade.
- **Fornecedores** — fornecedores com código, nome, status e cidade.
- **Embalagens** — tabela associativa entre peças e fornecedores, com a quantidade embarcada.

A partir desse modelo, são praticadas consultas como:

- Filtrar peças por código específico.
- Filtrar fornecedores por status e cidade.
- Listar cidades distintas de fornecedores (`DISTINCT`).
- Cruzar peças, fornecedores e embarques com `JOIN` para obter quantidades e fornecedores relacionados a uma peça.

---

## 🛠️ Tecnologias utilizadas

- **SQL** (MySQL)
- **MySQL Workbench** (ou outro cliente SQL de sua preferência)

---

## 🚀 Como usar

1. Clone o repositório:
   ```bash
   git clone https://github.com/namartinxs/fund_bdUni.git
   cd fund_bdUni
   ```
2. Escolha a pasta ou o arquivo `.sql` referente à aula/lista que deseja executar.
3. Rode o script no seu cliente SQL de preferência, por exemplo:
   ```bash
   mysql -u seu_usuario -p < lista8.sql
   ```
4. Cada script cria seu próprio banco (`CREATE DATABASE ...`), então podem ser executados de forma independente, sem conflito entre si.

---

## 👩‍💻 Autor

Desenvolvido por [namartinxs](https://github.com/namartinxs) como material de estudo da disciplina.

---

## 📄 Licença

Repositório de uso acadêmico, livre para fins de estudo e consulta.
