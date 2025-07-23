*** Settings ***
Library           SeleniumLibrary
Variables         ../data_pool/DataPool_login.yaml

*** Variables ***

*** Keywords ***
Acessar a home page do site "${TITLE}"
    Go To  url=${URL.homol}
    # Wait Until Element Is Visible    locator=${TITULO_LOGIN}
    Wait Until Page Contains    text=${TITLE}
    
Clicar no campo de usuário "${USER-NAME}"
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER-NAME}
    Input Text  id=${USER-NAME}     ${user_data.homol.user_name}


Clicar no campo de senha "${KEY-PASSWORD}"
    # Element Should Be Visible    id=${PASSWORD}
    Click Element  id=${KEY-PASSWORD}
    Input Text  id=${KEY-PASSWORD}      ${user_data.homol.password}

Clicar no botão login "${LOGIN_BUTTON}"
    Click Element    id=${LOGIN_BUTTON}
    Sleep   10s

Login como usuário válido
    Acessar a home page do site "Swag Labs"
    Clicar no campo de usuário "user-name"
    Clicar no campo de senha "password"
    Clicar no botão login "login-button"