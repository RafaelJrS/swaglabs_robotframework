*** Settings ***
Library           SeleniumLibrary

*** Variables ***

*** Keywords ***
Clicar no botão checkout
    Click Button    id=checkout
    Wait Until Element Is Visible    xpath=//*[text()="Checkout: Your Information"]

Clicar no botão continue
    Click Button    id=continue

Verificar se a mensagem de erro "Error: First Name is required" é exibida
    Element Should Be Visible    xpath=//h3[contains(text(), "Error: First Name is required")]

Preencher o campo "First Name" com um valor válido
    Click Element    id=first-name
    Input Text    id=first-name    Test

Verificar se a mensagem de erro "Error: Last Name is required" é exibida
    Element Should Be Visible    xpath=//h3[contains(text(), "Error: Last Name is required")]

Preencher o campo "Last Name" com um valor válido
    Click Element    id=last-name
    Input Text    id=last-name    User

Verificar se a mensagem de erro "Error: Postal Code is required" é exibida
    Element Should Be Visible    xpath=//h3[contains(text(), "Error: Postal Code is required")]