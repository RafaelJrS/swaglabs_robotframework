*** Settings ***
Documentation     Essa suite realiza testes no site https://www.saucedemo.com
Resource          ../resources/swaglabs_resources.robot
Resource          ../resources/pages/PO_login.robot
Resource          ../resources/keywords/KW_carrinho_compras.robot
Resource          ../resources/keywords/KW_checkout.robot
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
    [Tags]             add_carrinho carrinho_vazio
    Login como usuário válido
    Verificar se o carrinho está vazio
    Retornar a home page do site "Swag Labs"
    Verificar se a home page do site "Swag Labs" é exibida
    Selecionar o produto "Sauce Labs Bolt T-Shirt"
    Adicionar o produto ao carrinho
    Verificar se o produto foi adicionado ao carrinho com sucesso

Caso de Teste 03 - Remover produto do carrinho
    [Documentation]    Esse teste realiza a remoção de um produto do carrinho
    [Tags]             remove_carrinho
    Login como usuário válido
    Adicionar produto ao carrinho
    Remover o produto do carrinho
    Verificar se o carrinho está vazio

Caso de Teste 04 - Mensagem de erro First Name is required
    [Documentation]    Esse teste verifica a mensagem de erro quando o campo "First Name" é deixado em branco
    ...                ao tentar finalizar a compra
    [Tags]             mensagem_erro_first_name
    Login como usuário válido
    Adicionar produto ao carrinho
    Clicar no botão checkout
    Clicar no botão continue
    Verificar se a mensagem de erro "Error: First Name is required" é exibida

Caso de Teste 05 - Mensagem de erro Last Name is required
    [Documentation]    Esse teste verifica a mensagem de erro quando o campo "Last Name" é deixado em branco
    ...                ao tentar finalizar a compra
    [Tags]             mensagem_erro_last_name
    Login como usuário válido
    Adicionar produto ao carrinho
    Clicar no botão checkout
    Preencher o campo "First Name" com um valor válido
    Clicar no botão continue
    Verificar se a mensagem de erro "Error: Last Name is required" é exibida

Caso de Teste 06 - Mensagem de erro Postal Code is required
    [Documentation]    Esse teste verifica a mensagem de erro quando o campo "Postal Code" é deixado em branco
    ...                ao tentar finalizar a compra
    [Tags]             mensagem_erro_postal_code
    Login como usuário válido
    Adicionar produto ao carrinho
    Clicar no botão checkout
    Preencher o campo "First Name" com um valor válido
    Preencher o campo "Last Name" com um valor válido
    Clicar no botão continue
    Verificar se a mensagem de erro "Error: Postal Code is required" é exibida

Caso de Teste 07 - Concluir as informação do checkout com sucesso
    [Documentation]    Esse teste verifica a conclusão das informações do checkout com sucesso
    [Tags]             checkout_sucesso
    Login como usuário válido
    Adicionar produto ao carrinho
    Clicar no botão checkout
    Preencher o campo "First Name" com um valor válido
    Preencher o campo "Last Name" com um valor válido
    Preencher o campo "Postal Code" com um valor válido
    Clicar no botão continue
    Verificar se a página Checkout: Overview é exibida

Caso de Teste 08 - Finalizar a compra com sucesso
    [Documentation]    Esse teste verifica a finalização da compra com sucesso
    [Tags]             compra_finalizada_sucesso
    Login como usuário válido
    Adicionar produto ao carrinho
    Concluir as informação do checkout com sucesso
    Clicar no botão finish
    Verificar se a mensagem "Thank you for your order!" é exibida

Caso de Teste 09 - retornar a home page do site "Swag Labs" após finalizar a compra
    [Documentation]    Esse teste verifica o retorno à home page do site "Swag Labs
    ...                " após finalizar a compra
    [Tags]             back_home_bnt_
    Login como usuário válido
    Adicionar produto ao carrinho
    Concluir as informação do checkout com sucesso
    Finalizar a compra com sucesso
    Clicar no botão back_home
    Verificar se a home page do site "Swag Labs" é exibida