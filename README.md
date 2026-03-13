# Workout Tracker

## Visão Geral

Workout Tracker é um aplicativo mobile desenvolvido em **Flutter** com o objetivo de registrar, organizar e analisar atividades físicas realizadas pelo usuário.

A aplicação permite que o usuário registre exercícios realizados, armazenando informações como:

* Nome do exercício
* Duração da atividade
* Calorias estimadas
* Data do treino

A partir desses dados, o aplicativo fornece **indicadores visuais de progresso**, possibilitando o acompanhamento da evolução das atividades físicas ao longo do tempo.

O sistema utiliza **persistência local de dados com Hive**, permitindo funcionamento totalmente **offline-first**, garantindo desempenho elevado e armazenamento eficiente no dispositivo.

```markdown
Workout Tracker
────────────────

[ META DIÁRIA ]
420 / 500 kcal
██████████░░░░

[ STATS ]
┌─────────┬─────────┐
│ Treinos │ Tempo   │
│   12    │  180m   │
└─────────┴─────────┘
┌─────────┬─────────┐
│Calorias │ Média   │
│ 1420    │ 118 kcal│
└─────────┴─────────┘

[ EVOLUÇÃO ]
📈 gráfico

[ TREINOS RECENTES ]
Flexão
Corrida
Abdominal
```

<img width="2501" height="2876" alt="test_tcc_app" src="https://github.com/user-attachments/assets/7f1b0d4c-4ab5-42fe-ba73-f69204ada82b" />

![test_tcc_app](https://github.com/user-attachments/assets/5d6ce3fc-a56e-4372-9c76-55fb5810e2e1)

---

# Funcionalidades

O aplicativo possui as seguintes funcionalidades principais:

### Registro de exercícios

O usuário pode adicionar novos exercícios informando:

* Nome da atividade
* Duração em minutos
* Calorias estimadas
* Data do treino

### Histórico de atividades

Todos os exercícios registrados ficam armazenados no dispositivo e podem ser visualizados posteriormente.

### Indicadores de progresso

O sistema calcula indicadores básicos de progresso, permitindo visualizar:

* Total de exercícios registrados
* Calorias acumuladas
* Tempo total de treino
* Progresso de metas

### Persistência local

Os dados são armazenados utilizando **Hive**, um banco de dados NoSQL leve e extremamente rápido para aplicações Flutter.

---

# Arquitetura do Sistema

A aplicação foi projetada utilizando uma arquitetura modular baseada em separação de responsabilidades.

Principais camadas do sistema:

```
UI (Screens / Widgets)
        ↓
Controllers / Services
        ↓
Modelos de Dados
        ↓
Persistência (Hive Database)
```

### Camadas

**UI (Interface do usuário)**
Responsável por renderizar telas, dashboards e componentes visuais.

**Modelos de Dados**
Representam as estruturas que armazenam informações da aplicação.

Exemplo:

```
WorkoutModel
- name
- duration
- calories
- date
```

**Serviços de armazenamento**
Responsáveis por abstrair o acesso ao banco de dados.

**Banco de dados local**
Hive é utilizado como mecanismo de persistência.

---

# Tecnologias Utilizadas

## Flutter

Framework de desenvolvimento multiplataforma criado pelo Google.

Principais vantagens:

* Alta performance
* Renderização própria
* UI moderna
* Código único para múltiplas plataformas

---

## Dart

Linguagem de programação utilizada pelo Flutter.

Características:

* Tipagem forte
* Compilação AOT e JIT
* Suporte a programação assíncrona
* Alta performance para aplicações mobile

---

## Hive Database

Hive é um banco de dados **NoSQL local orientado a chave-valor** extremamente rápido.

Vantagens:

* Performance superior ao SQLite em muitos casos
* Simplicidade de uso
* Persistência eficiente
* Ideal para aplicações offline

---

# Instalação do Projeto

## Requisitos

Antes de executar o projeto, é necessário possuir instalado:

* Flutter SDK
* Dart SDK
* Android Studio ou VS Code
* Git

Verifique a instalação do Flutter com:

```
flutter doctor
```

---

# Clonando o projeto

```
git clone https://github.com/seu-repositorio/workout_tracker.git
```

Entre na pasta do projeto:

```
cd workout_tracker
```

---

# Instalação das dependências

Execute:

```
flutter pub get
```

---

# Gerar arquivos do Hive

O Hive utiliza **code generation** para criar os adapters.

Execute:

```
dart run build_runner build
```

Esse comando irá gerar os arquivos:

```
*.g.dart
```

---

# Executando o projeto

Para rodar em modo debug:

```
flutter run
```

Para build Android:

```
flutter build apk
```

Para build iOS:

```
flutter build ios
```

---

# Estrutura do Projeto

```
lib/
 ├── models/
 │    └── workout_model.dart
 │
 ├── screens/
 │    └── home_screen.dart
 │
 ├── widgets/
 │    ├── workout_card.dart
 │    ├── progress_widget.dart
 │    └── goal_widget.dart
 │
 ├── services/
 │    └── storage_service.dart
 │
 └── main.dart
```

### Descrição

**models/**
Define as estruturas de dados.

**screens/**
Contém as telas principais da aplicação.

**widgets/**
Componentes reutilizáveis da interface.

**services/**
Camada de lógica responsável pelo acesso ao banco de dados.

---

# Persistência de Dados

O aplicativo utiliza **Hive** para armazenar dados localmente.

O Hive funciona através de **boxes**, que são coleções de dados persistidas no dispositivo.

Exemplo:

```
Box<WorkoutModel> workoutsBox
```

Cada registro é armazenado como um objeto serializado.

Isso garante:

* Alta velocidade
* Baixo consumo de memória
* Persistência segura

---

# Análise de Dados

A aplicação utiliza os dados registrados para gerar indicadores como:

* Soma de calorias gastas
* Tempo total de treino
* Frequência de exercícios

Essas análises representam conceitos fundamentais de **análise de dados aplicada a sistemas de software**, incluindo:

* agregação de dados
* processamento de registros históricos
* geração de métricas

Essas métricas podem ser usadas para gerar **dashboards de progresso e gráficos de evolução**.

---

# Escalabilidade

Embora o aplicativo utilize armazenamento local, a arquitetura foi pensada para permitir futura expansão.

Possíveis evoluções incluem:

* sincronização com servidores
* integração com APIs externas
* armazenamento em nuvem
* sistema de contas de usuário

A separação entre **UI, modelos e serviços** facilita a substituição do mecanismo de armazenamento.

Por exemplo:

Hive → Firebase → PostgreSQL → APIs REST.

---

# Manutenção do Sistema

A manutenção da aplicação pode ser realizada através de:

### Atualização de dependências

```
flutter pub upgrade
```

### Refatoração de código

A modularização do projeto facilita manutenção e evolução.

### Testes

Podem ser implementados testes:

* unitários
* integração
* testes de interface

---

# Conhecimentos empregados

O desenvolvimento desta aplicação envolve diversos conceitos fundamentais da área de computação.

## Engenharia de Software

Aplicação de boas práticas como:

* modularização
* separação de responsabilidades
* organização de código
* versionamento

---

## Banco de Dados

Uso de banco NoSQL local para persistência de dados.

Conceitos aplicados:

* modelagem de dados
* serialização
* armazenamento persistente
* estruturação de registros

---

## Análise de Dados

A partir dos dados coletados, é possível gerar indicadores de desempenho físico.

Conceitos aplicados:

* agregação de dados
* cálculo de métricas
* geração de relatórios

---

## Internet das Coisas (IoT)

A arquitetura do aplicativo permite futura integração com dispositivos IoT como:

* smartwatches
* pulseiras fitness
* sensores biométricos
* equipamentos de academia conectados

Esses dispositivos poderiam fornecer dados como:

* frequência cardíaca
* passos
* gasto calórico
* intensidade do exercício

---

# Melhorias Futuras

O sistema pode evoluir para incluir diversas funcionalidades adicionais.

### Gráficos de evolução

Integração com bibliotecas como:

* fl_chart
* syncfusion charts

Para visualizar progresso semanal e mensal.

---

### Metas personalizadas

Permitir ao usuário definir objetivos como:

* calorias por semana
* tempo de treino
* número de exercícios

---

### Sistema de notificações

Notificações para lembrar o usuário de realizar atividades físicas.

---

### Integração com dispositivos fitness

Conexão com APIs como:

* Google Fit
* Apple Health
* Wearables

---

### Sincronização em nuvem

Sincronização dos dados do usuário entre múltiplos dispositivos.

---

# Conclusão

Workout Tracker demonstra a aplicação prática de diversos conceitos fundamentais da computação moderna, incluindo:

* desenvolvimento mobile
* persistência de dados
* análise de informações
* arquitetura de software

A estrutura modular do projeto permite evolução contínua, possibilitando expansão para novas funcionalidades, integrações e melhorias de desempenho.

O projeto serve como base para sistemas mais complexos voltados para **monitoramento de atividades físicas e análise de desempenho pessoal**.
