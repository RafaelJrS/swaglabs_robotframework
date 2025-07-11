Projeto RobotFramework

Esse projeto tem como o intuito realizar automações em robot via web e api através do curso da "Mayara Fernandes" na Udemy link: "https://www.udemy.com/course/automacao-de-testes-com-robot-framework-basico/?couponCode=PMNVD2025"

Implementações Robot


Arquivo de testes.robot

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


Arquivo de resources.robot

    Escrita de resources em implementação de "Settings"
        Library: Serve para buscar a biblioteca que será utilizada.

    Escrita de resources em implementação de "Variables"
        Serve para declarações de valores fixos.
        Declaração de variavel = ${}

    Escrita de resources em implementação de "Keywords"
        Titulo: Iniciado no começo da frase escostado no canto esquerdo.


Comandos para rodar no terminal
    Todo comando começa por robot:
        robot -v BROWSER:firefox -i login_sucesso -d resultados swaglabs_testes.robot
    
    -v =  variavel
    Dúvidas: robot --help

Rodar comandos fora do VSCode direto no CMD do Windows
    abre o CMD direto na pasta que tem seu repositorio, insere os codigos de execução necessários.

Atalhos windows para suporte
    Comentar as linhas de códigos: CTRL + ;


Obs: As informações implementadas para ação no robot são chamados de "keywords".
     A documentação do Selenium Library que conter sinal de "=", pré condiz que não precisa inserir informações obrigatória. Sem esse valor, esse campo deve conter a informação necessária, conforme mencionado na documentação "https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html".
