*** Settings ***
Documentation     Essa suite realiza testes no site https://www.saucedemo.com/v1/
Resource          ../resources/swaglabs_resources.robot
Resource          ../resources/pages/PO_login.robot
Test Setup      Abrir o navegador
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Login com sucesso em swaglabs v1
    [Documentation]    Esse teste realiza o login do swaglabs
    ...                valida se o retorno do site esta correto
    [Tags]             login_sucesso
    Acessar a home page do site "Swag Labs"
    Clicar no campo de usuário "user-name"
    Clicar no campo de senha "password"
    Clicar no botão login "login-button"


Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a pesquisa de um produto na Amazon
    [Tags]             busca_produtos  pesquisa
    Login como usuário válido
    # Digitar o nome de produto "Camiseta x" no campo de pesquisa
    # Clicar no botão de pesquisa
    # Verificar o resultado da pesquisa se está listando o produto pesquisado