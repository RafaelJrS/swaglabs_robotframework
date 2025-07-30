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