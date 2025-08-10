*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/PO_carrinho_compras.robot
Resource          ../libs/captura-tela.robot

*** Keywords ***
Verificar se o carrinho está vazio
    Click Element    ${BNT_CARRINHO}
    Element Should Not Be Visible    ${ITEM_CARRINHO_VAZIO}
    Capturar Tela e Incrementar Passo    "Verificar se o carrinho está vazio"

Retornar a home page do site "Swag Labs"
    Click Element    ${BNT_BURGER_MENU}
    Sleep    1s
    Click Element    ${BNT_ALL_ITEMS}
    Sleep    1s
    Capturar Tela e Incrementar Passo    "Retornar a home page do site 'Swag Labs'"

Verificar se a home page do site "Swag Labs" é exibida
    Wait Until Element Is Visible    ${BODY_HOME_PAGE}
    Element Should Be Visible    ${BODY_HOME_PAGE}
    Capturar Tela e Incrementar Passo    "Verificar se a home page do site 'Swag Labs' é exibida"

Selecionar o produto "Sauce Labs Bolt T-Shirt"
    Click Element    ${PROD_T-SHIT}
    Sleep    1s
    Element Should Be Visible    ${PROD_T-SHIT_VISIBLE}
    Capturar Tela e Incrementar Passo    "Selecionar o produto 'Sauce Labs Bolt T-Shirt'"

Adicionar o produto ao carrinho
    Click Element    ${BNT_ADD_CART}
    Sleep    1s
    Element Should Be Visible    ${INFO_PROD_ADD_CART}
    Capturar Tela e Incrementar Passo    "Adicionar o produto ao carrinho"

Verificar se o produto foi adicionado ao carrinho com sucesso
    Click Element    ${BNT_CARRINHO}
    Sleep    1s
    Element Should Be Visible    ${PROD_VISIBLE_IN_CART}
    Capturar Tela e Incrementar Passo    "Verificar se o produto foi adicionado ao carrinho com sucesso"

Remover o produto do carrinho
    Click Element    ${BNT_CARRINHO}
    Sleep    1s
    Element Should Be Visible    ${PROD_VISIBLE_IN_CART}
    Click Element    ${BNT_REMOVE_CART}
    Sleep    1s
    Capturar Tela e Incrementar Passo    "Remover o produto do carrinho"

Adicionar produto ao carrinho
    Verificar se o carrinho está vazio
    Retornar a home page do site "Swag Labs"
    Selecionar o produto "Sauce Labs Bolt T-Shirt"
    Adicionar o produto ao carrinho
    Verificar se o produto foi adicionado ao carrinho com sucesso