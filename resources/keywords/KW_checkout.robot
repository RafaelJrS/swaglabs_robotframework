*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/PO_checkout.robot

*** Keywords ***
Clicar no botão checkout
    Click Button    ${BNT_CHECKOUT}
    Wait Until Element Is Visible    ${TXT_CHECKOUT_INFO}

Clicar no botão continue
    Click Button    ${BNT_CONTINUE}

Verificar se a mensagem de erro "Error: First Name is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_FIRST_NAME}

Preencher o campo "First Name" com um valor válido
    Click Element    ${BNT_FIRST_NAME}
    Input Text    ${BNT_FIRST_NAME}    ${TXT_FIRST_NAME}

Verificar se a mensagem de erro "Error: Last Name is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_LAST_NAME}

Preencher o campo "Last Name" com um valor válido
    Click Element    ${BNT_LAST_NAME}
    Input Text    ${BNT_LAST_NAME}    ${TXT_LAST_NAME}

Verificar se a mensagem de erro "Error: Postal Code is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_POSTAL_CODE}

Preencher o campo "Postal Code" com um valor válido
    Click Element    ${BNT_POSTAL_CODE}
    Input Text    ${BNT_POSTAL_CODE}    ${TXT_POSTAL_CODE}

Verificar se a página Checkout: Overview é exibida
    Element Should Be Visible    ${TXT_CHECKOUT_OVERVIEW}

Concluir as informação do checkout com sucesso
    Clicar no botão checkout
    Preencher o campo "First Name" com um valor válido
    Preencher o campo "Last Name" com um valor válido
    Preencher o campo "Postal Code" com um valor válido
    Clicar no botão continue
    Verificar se a página Checkout: Overview é exibida
    
Finalizar a compra com sucesso
    Clicar no botão finish
    Verificar se a mensagem "Thank you for your order!" é exibida

Clicar no botão finish
    Click Element    ${BNT_FINISH}

Verificar se a mensagem "Thank you for your order!" é exibida
    Element Should Be Visible    ${TXT_THANK_YOU_FOR_YOUR_ORDER}

Clicar no botão back_home
    Click Element    ${BNT_BACK_HOME}