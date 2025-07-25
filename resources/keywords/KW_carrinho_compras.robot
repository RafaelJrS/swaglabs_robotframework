*** Settings ***
Library           SeleniumLibrary
Library    XML

*** Variables ***
${BNT_CARRINHO}   id=shopping_cart_container
${ITEM_CARRINHO_VAZIO}   xpath=//*[@id="cart_contents_container"]/div/div[1]/div[3]
${BNT_BURGER_MENU}   id=react-burger-menu-btn
${BNT_ALL_ITEMS}   id=inventory_sidebar_link
${BODY_HOME_PAGE}   id=inventory_container
${PROD_T-SHIT}    xpath=//*[@id="item_1_title_link"]/div
${PROD_T-SHIT_VISIBLE}   xpath=//*[@id="inventory_item_container"]/div/div/div[2]/div[1]
${BNT_ADD_CART}   id=add-to-cart
${INFO_PROD_ADD_CART}   class=shopping_cart_badge
${PROD_VISIBLE_IN_CART}    xpath=//*[@id="item_1_title_link"]/div
# class=shopping_cart_link


*** Keywords ***
Verificar se o carrinho está vazio
    Click Element    ${BNT_CARRINHO}
    Element Should Not Be Visible    ${ITEM_CARRINHO_VAZIO}

Retornar a home page do site "Swag Labs"
    Click Element    ${BNT_BURGER_MENU}
    Sleep    1s
    Click Element    ${BNT_ALL_ITEMS}
    Sleep    1s
    Wait Until Element Is Visible    ${BODY_HOME_PAGE}
    Element Should Be Visible    ${BODY_HOME_PAGE}

Selecionar o produto "Sauce Labs Bolt T-Shirt"
    Click Element    ${PROD_T-SHIT}
    Sleep    1s
    Element Should Be Visible    ${PROD_T-SHIT_VISIBLE}

Adicionar o produto ao carrinho
    Click Element    ${BNT_ADD_CART}
    Sleep    1s
    Element Should Be Visible    ${INFO_PROD_ADD_CART}
    
Verificar se o produto foi adicionado ao carrinho com sucesso
    Click Element    ${BNT_CARRINHO}
    Sleep    1s
    Element Should Be Visible    ${PROD_VISIBLE_IN_CART}