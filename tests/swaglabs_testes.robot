*** Settings ***
Documentation     Essa suite realiza testes no site https://www.saucedemo.com
Resource          ../resources/swaglabs_resources.robot
Resource          ../resources/pages/PO_login.robot
Resource          ../resources/keywords/KW_carrinho_compras.robot
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


Caso de Teste 02 - Adicionar produto ao carrinho 
    [Documentation]    Esse teste realiza a adição de um produto ao carrinho
    ...                valida se o produto foi adicionado corretamente
    ...                e se o carrinho foi atualizado
    [Tags]             busca_produtos  pesquisa
    Login como usuário válido
    Verificar se o carrinho está vazio
    Retornar a home page do site "Swag Labs"
    Selecionar o produto "Sauce Labs Bolt T-Shirt"
    Adicionar o produto ao carrinho
    Verificar se o produto foi adicionado ao carrinho com sucesso