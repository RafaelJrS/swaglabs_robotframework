*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/PO_checkout.robot
Resource          ../libs/captura-tela.robot

*** Keywords ***
Clicar no botão checkout
    Click Button    ${BNT_CHECKOUT}
    Wait Until Element Is Visible    ${TXT_CHECKOUT_INFO}
    Capturar Tela e Incrementar Passo    "Clicar no botão checkout"

Clicar no botão continue
    Click Button    ${BNT_CONTINUE}
    Capturar Tela e Incrementar Passo    "Clicar no botão continue"

Verificar se a mensagem de erro "Error: First Name is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_FIRST_NAME}
    Capturar Tela e Incrementar Passo    "Verificar mensagem de erro para campo 'First Name'"

Preencher o campo "First Name" com um valor válido
    Click Element    ${BNT_FIRST_NAME}
    Input Text    ${BNT_FIRST_NAME}    ${TXT_FIRST_NAME}
    Capturar Tela e Incrementar Passo    "Preencher o campo 'First Name' com um valor válido"

Verificar se a mensagem de erro "Error: Last Name is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_LAST_NAME}
    Capturar Tela e Incrementar Passo    "Verificar mensagem de erro para campo 'Last Name'"

Preencher o campo "Last Name" com um valor válido
    Click Element    ${BNT_LAST_NAME}
    Input Text    ${BNT_LAST_NAME}    ${TXT_LAST_NAME}
    Capturar Tela e Incrementar Passo    "Preencher o campo 'Last Name' com um valor válido"

Verificar se a mensagem de erro "Error: Postal Code is required" é exibida
    Element Should Be Visible    ${TXT_ERROR_POSTAL_CODE}
    Capturar Tela e Incrementar Passo    "Verificar se a mensagem de erro 'Error: Postal Code is required' é exibida"

Preencher o campo "Postal Code" com um valor válido
    Click Element    ${BNT_POSTAL_CODE}
    Input Text    ${BNT_POSTAL_CODE}    ${TXT_POSTAL_CODE}
    Capturar Tela e Incrementar Passo    "Preencher o campo 'Postal Code' com um valor válido"

Verificar se a página Checkout: Overview é exibida
    Element Should Be Visible    ${TXT_CHECKOUT_OVERVIEW}
    Capturar Tela e Incrementar Passo    "Verificar se a página Checkout: Overview é exibida"

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
    Capturar Tela e Incrementar Passo    "Clicar no botão finish"

Verificar se a mensagem "Thank you for your order!" é exibida
    Element Should Be Visible    ${TXT_THANK_YOU_FOR_YOUR_ORDER}
    Capturar Tela e Incrementar Passo    "Verificar se a mensagem 'Thank you for your order!' é exibida"

Clicar no botão back_home
    Click Element    ${BNT_BACK_HOME}
    Capturar Tela e Incrementar Passo    "Clicar no botão back_home"