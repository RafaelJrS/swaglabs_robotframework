*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BNT_CARRINHO}           id=shopping_cart_container
${ITEM_CARRINHO_VAZIO}    xpath=//*[@id="cart_contents_container"]/div/div[1]/div[3]
${BNT_BURGER_MENU}        id=react-burger-menu-btn
${BNT_ALL_ITEMS}          id=inventory_sidebar_link
${BODY_HOME_PAGE}         id=inventory_container
${PROD_T-SHIT}            xpath=//*[@id="item_1_title_link"]/div
${PROD_T-SHIT_VISIBLE}    xpath=//*[@id="inventory_item_container"]/div/div/div[2]/div[1]
${BNT_ADD_CART}           id=add-to-cart
${INFO_PROD_ADD_CART}     class=shopping_cart_badge
${PROD_VISIBLE_IN_CART}   xpath=//*[@id="item_1_title_link"]/div
${BNT_REMOVE_CART}        id=remove-sauce-labs-bolt-t-shirt