# PROJETO DE ROBOT FRAMEWORK + SELENIUM

![Robot Framework](https://img.shields.io/badge/-Robot-05122A?style=flat&logo=robot-framework)&nbsp;

>Este projeto tem como objetivo realizar realizar automações em robot framework via web com a biblioteca Selenium no site https://www.saucedemo.com/v1/


robot --outputdir resultados tests/swaglabs_testes.robot

## 🚀 Tecnologias e Ferramentas

* **Linguagem:** Python
* **Framework de Teste:** RobotFramework
* **Bibliotecas** Selenium, Request

## 🎯 Escopo dos Testes

O projeto cobrirá os seguintes fluxos de usuário:
- [ ] Testes de Login (válido, usuário bloqueado).
- [ ] Verificar seleção de produtos.
- [ ] Carrinho de compras vazio.
- [ ] Mensagens de erro.
- [ ] Adição e remoção de produtos do carrinho de compras.
- [ ] Realização de fluxo completo de checkout.

## 📂 Estrutura de Pastas

O projeto segue a estrutura Separation of Concerns no RobotFramework, organizando pastas, arquivos e keywords por resposabilidade. 
De forma que cada parte do projeto resolva uma necessidade especifica.

/resources

/data_pool (Massa de dados fixa para os testes como: url, login, senha)

/keywords (Aonde aonde ficam as keywords de estrutura das frases criadas)

/libs (Ficam as funções auxiliares)

/pages (Aonda estão os elementos da pagina para utilizar nas keywords)

/tests (Agrupa as suites com os cenários de testes)


## ⚙️ Como Executar o Projeto

**Clone o repositório**

    git clone https://github.com/RafaelJrS/swaglabs_robotframework.git

## Instalações:

**Python**

    Site: https://www.python.org/downloads/
        Baixar via browser e seguir instalação selecionando as opções
        Para verificar a versão do python: python --version
        Para verificar se esta no ambiente: pesquisa sobre a editar as variáveis de ambiente do sistema, abre a opção pesquisada do sistema, 
        segue as opções: Variáveis de ambiente > path > Editar > c:...\python\

**Robot Framework**

    Site: https://robotframework.org/
        Abrir prompt CMD
        Verificar se o pip esta instalado: pip --version
        Executar o comando: pip install robotframework
            Obs: verificar se o robotframework foi instalado: robot --version

**VS Code IDE**

    Site: https://code.visualstudio.com/download
        Baixar via browser e seguir instalação
        Extensões: RobotFramework Language; material icon theme; dracula theme

**Bibliotecas/libraries**

    Site: https://github.com/robotframework/SeleniumLibrary/
        Selenium Library: rodar comando no cmd pip install --upgrade robotframework-seleniumlibrary
    Site: https://docs.robotframework.org/docs/different_libraries/requests
        Requests Library: rodar comando no cmd pip install robotframework-requests
            Obs: verificar bibliotecas instaladas: comando pip list

**Downloads Drivers**

    Site: https://github.com/mozilla/geckodriver/releases
        Geckodriver: verificar a versão em ajuda/sobre o firefox no browser
        realizar o download da ultima versão disponível
    Site: https://developer.chrome.com/docs/chromedriver/downloads?hl=pt-br
        Chromedriver: verificar a versão em ajuda/sobre o chrome no browser
        realizar o download da versão do chrome
            Obs: colocar os drivers na pasta de script dentro da pasta python instalado localmente

**Instalando YAML**

    Site: https://gist.github.com/GLMeece/79954b3ea2f8efa5f3ed5c2bd6a267b8
        YAML: rodar comando no terminal pip install pyyaml
            Obs: o yaml esta usando o data_pool do projeto aonde estão as informações de URL, Login, senha, etc. Caso de erro na sintaxe do yaml não reconhecendo a variável basta realizar clear algumas vezes no terminal, salvando o local que chama a variavél ou reiniciar o vscode.



## **Entendendo o Projeto**


**Arquivo de testes.robot**

    Escrita de testes em implementação de "Settings"
        Documentation: Serve para documentar e explicar para que serve aquela suite de testes
        Test: para realizar somente um caso de teste
        Suite: para rodas todos os testes
        Resource: serve para pegar as informações implementadas de outro arquivo

    Escrita de testes em implementação de "Test Cases"
        Titulo: Ao escrever o titulo do teste deve está encostado no inicio do corpo de escrita, assim o robot reconhecerá como o titulo.
        Não deve ter mais de dois espaços nas frases, pois será considerado outra implementação.
        As frases abaixo do titulo com diferença de dois espaços do canto esquerdo, são considerados o passo a passo da execução de teste. Como sub-conjunto do titulo (teste).
        [Documentation]: Serve para documentar e explicar para que serve aqueles testes
        [Tags]: Serve para mapear qual o teste executado dentro da suite. Pode-se colocar mais tags separado por dois espaços.


**Arquivo de resources.robot**

    Escrita de resources em implementação de "Settings"
        Library: Serve para buscar a biblioteca que será utilizada.
        Variables: Serve para buscar a informação das variáveis salvas

    Escrita de resources em implementação de "Variables"
        Serve para declarações de valores fixos.
        Declaração de variavel = ${}

    Escrita de resources em implementação de "Keywords"
        Titulo: Iniciado no começo da frase encostado no canto esquerdo.

**Data_pool**

    Pasta de arquivos para guardar as informações de variáveis sensiveis como de login, senhas, entre outras.       

**Keywords**

    Pasta de arquivos para inserir as informações de comandos da página como selecionar, preencher, clicar, visualizar, entre outras.

**Pages**

    Pasta de arquivos para guardar as variaveis que estão sendo usadas nos comandos das keywords como xpath, css, text, entre outras.

## **Comandos para rodar no terminal**

**Todo comando começa por robot:**

    robot -v BROWSER:firefox -i login_sucesso -d resultados swaglabs_testes.robot

    rodar a suite:
        robot -d resultados swaglabs_testes.robot

    rodar o teste:
        robot --test "Caso de Teste 02 - Pesquisa de um produto" swaglabs_testes.robot
    
    -v =  variavel

    Dúvidas: robot --help

    Rodar um teste especifico e salvar as informações de output, log e report desntro da pasta libs
    robot --outputdir resources/libs --test "Cole seu cenário de teste aqui" tests/swaglabs_testes.robot

    Após rodar o teste de output, dentro da pasta resources/libs, rodar comando no terminal
    python gerar_pdf_evidencias.py    

**Rodar comandos fora do VSCode direto no CMD do Windows**

    abre o CMD direto na pasta que tem seu repositorio, insere os codigos de execução necessários.

**Atalhos windows para suporte**

    Comentar as linhas de códigos: CTRL + ;


### *OBSERVAÇÕES:*

    As informações implementadas para ação no robot são chamados de "keywords".
     A documentação do Selenium Library que conter sinal de "=", pré condiz que não precisa inserir informações obrigatória. Sem esse valor, esse campo deve conter a informação necessária, conforme mencionado na documentação "https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html".