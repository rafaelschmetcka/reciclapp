# Reciclapp

O **Reciclapp** é um aplicativo desenvolvido como parte do projeto de *Technological Craftsmanship Works* na **Universidade Tecnológica Federal do Paraná - UTFPR**. O objetivo da aplicação é facilitar o processo de reciclagem, conectando usuários que desejam descartar materiais devidamente reciclados com coletores que podem coletá-los.


## Funcionalidades

- **Cadastro de Usuário:** O usuário pode se cadastrar como doador ou coletor.
- **Criação de Coletas:** O doador pode registrar uma coleta informando os materiais disponíveis.
- **Listagem de Coletas:** O coletor pode visualizar as coletas disponíveis e aceitar aquelas que deseja recolher.
- **Atualização de Status:** O status da coleta pode ser atualizado para Criado, Em Andamento e Finalizado.
- **Histórico de Coletas:** O usuário pode visualizar seu histórico de coletas.
- **Sistema de Pontuação:** Usuários acumulam pontos conforme suas atividades no app.

## Tela de Login e Cadastro

- **Ações:** 
Para cadastro inserir nome, e-mail e senha de acesso.
- **Redirecionamento:**
Se for um usuário, redireciona para a tela inicial do usuário.
Se for um coletor, redireciona para a tela inicial do coletor.

![Tela Login](https://i.imgur.com/h0RpCDb.jpeg)

## Tela Inicial do Usuário

Carrossel com orientações para separação correta dos materiais reciclaveis e orgânicos.

- **Ações:**
Criar nova coleta.
Visualizar coletas criadas.

- **Redirecionamento:**
Acesso a tela de perfil e histórico.

![Tela Principal Usuário](https://i.imgur.com/loQfZNB.jpeg)

## Tela Perfil

- **Ações:**
Cadastro completo de perfil e endereço

![Tela Perfil](https://i.imgur.com/49XzRE3.jpeg)

## Solicitação de Coleta

- **Ações:**
Selecionar e confirmar uma data para a coleta.

![Solicitar Coleta](https://i.imgur.com/K1ahCrl.jpeg)

## Tela Inicial do Coletor

- **Ações:**
Visualizar coletas disponíveis e coletas em andamento.

![Tela Inicial Coletor](https://i.imgur.com/tTLJ1uC.jpeg)

## Aceitar e Finalizar uma Coleta

- **Ações:**
É possível visualizar os detalhes da coleta com nome e endereço do solicitante.
Para Finalizar é necessário incluir uma avaliação de 1 a 5 estrelas

![Aceitar e Avaliar Coletas](https://i.imgur.com/o2K6GB8.jpeg)

## Tela de Histórico

* **Ações:**
Visualizar todas as suas coletas com o status.

![Histórico](https://i.imgur.com/ZFvBOGs.jpeg)

## Estrutura do Banco de Dados (Supabase)

![Tabela Supabase Usuários](https://i.imgur.com/jtKhGLc.png)

_________________

![Tabela Supabase Histórico](https://i.imgur.com/X2bJRiJ.png)

## Tabela `Usuarios`

- **Campos principais:**
    - `id (UUID)` - Identificador único.
    - `nome (text)` - Nome do usuário.
    - `email (text)` - E-mail do usuário.
    - `tipo_usuario (boolean)` - Pode ser "Usuário" ou "Coletor".
    - `cep (text)` - Cep da coleta.
    - `estado (text)` - Estado da coleta.
    - `cidade (text)` - Cidade da coleta.
    - `bairro (text)` - Bairro onde será efetuada a coleta.
    - `rua (text)` - Rua da coleta.
    - `numero (Integer)` - Número da residência.
    - `complemento (text)` - Complemento.

## Tabela `Coletas`

- **Campos principais:**
    - `id (int8)` - Identificador único.
    - `usuario_id (UUID)` - Referência ao usuário que criou a coleta.
    - `coletor_id (UUID)` - Referência ao coletor que realizou a coleta.
    - `data_coleta (date)` - Data da coleta.
    - `descricao (text)` - Descrição dos materiais recicláveis.
    - `avaliacao_coletor (int2)` - Pontos atribuídos ao usuário.
    - `status (text)` - Staus da coleta, pode ser "Criada", "Em Andamento" ou "Finalizada".
    - `avaliacao_usuario (int2)` - Pontos atribuídos ao coletor (beta)

## Tabela `Historico`

- **Campos principais:**
    - `id (int8)` - Identificador único.
    - `usuario_id (UUID)` - Referência ao usuário que criou a coleta.
    - `coletor_id (UUID)` - Referência ao coletor que realizou a coleta.
    - `coleta_id (int8)` - Referência a coleta.
    - `status (text)` - Staus da coleta, pode ser "Criada", "Em Andamento" ou "Finalizada".
    - `data (date)` - Data da coleta.
    - `avaliacao_coletor (int2)` - Pontos atribuídos ao usuário.
    - `avaliacao_usuario (int2)` - Pontos atribuídos ao coletor (beta)

## Tecnologias Utilizadas

- FlutterFlow para o desenvolvimento da interface da aplicação.
- Supabase como backend, banco de dados e autenticação.
- Dart como linguagem principal no FlutterFlow.

## Instruções para Instalar o Projeto

Este projeto foi criado no **FlutterFlow** e pode ser rodado no **Android Studio**. 
Para começar, siga os passos abaixo.

## Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) (com plugins Flutter e Dart instalados)
- [Git](https://git-scm.com/)

### 1. **Clone o Repositório**

Primeiro, você precisa clonar o repositório para a sua máquina. No terminal, execute o comando:

```bash
git clone https://github.com/rafaelschmetcka/reciclapp.git
```

### 2. **Abra o Projeto no Android Studio**

Após clonar o repositório, abra o Android Studio.

File > Open > Selecione a pasta do projeto.

### 3. **Instale Dependências**

```bash
flutter pub get
```

Isso irá baixar todas as dependências do Flutter e preparar o projeto para ser executado.

### 4. **Executar o Aplicativo**

Conecte um dispositivo Android ou inicie um emulador (AVD Manager).

Selecione o dispositivo no menu superior direito do Android Studio.
## Licença

[MIT](https://choosealicense.com/licenses/mit/)


## Considerações Finais

O Reciclapp facilita o processo de reciclagem conectando usuários e coletores de forma simples e eficiente. Essa documentação fornece uma visão geral do projeto, fluxo de telas, estrutura de banco de dados e funcionalidades principais.
