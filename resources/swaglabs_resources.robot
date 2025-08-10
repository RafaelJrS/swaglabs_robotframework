*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROSER}  Chrome


*** Keywords ***
Abrir o navegador
    Open Browser  browser=${BROSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    # Capture Page Screenshot
    Close Browser

