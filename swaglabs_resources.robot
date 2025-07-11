*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROSER}  Chrome
${URL}  https://www.saucedemo.com/v1/
${TITULO_LOGIN}  //*[@id="login-button"]


*** Keywords ***
Abrir o navegador
    Open Browser  browser=${BROSER}  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site "${TITLE}"
    Go To  url=${URL}
    # Wait Until Element Is Visible    locator=${TITULO_LOGIN}
    Wait Until Page Contains    text=${TITLE}
    
Clicar no campo de usuário "${USER_NAME}"
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER_NAME}
    Input Text  id=${USER_NAME}  text=standard_user


Clicar no campo de senha "${PASSWORD}"
    # Element Should Be Visible    id=${PASSWORD}
    Click Element  id=${PASSWORD}
    Input Text  id=${PASSWORD}  text=secret_sauce

Clicar no botão login "${LOGIN_BUTTON}"
    Click Element    id=${LOGIN_BUTTON}
    Sleep   10s

Login como usuário válido
    Abrir o navegador
    Acessar a home page do site "Swag Labs"
    Clicar no campo de usuário "user-name"
    Clicar no campo de senha "password"
    Clicar no botão login "login-button"