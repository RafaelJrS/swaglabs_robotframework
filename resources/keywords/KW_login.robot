*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/PO_login.robot
Variables         ../data_pool/DataPool_login.yaml

*** Keywords ***
Acessar a home page do site "Swag Labs"
    Go To  url=${URL.homol}
    # Wait Until Element Is Visible    locator=${TITULO_LOGIN}
    Wait Until Page Contains    text=${TITLE}
    
Clicar no campo de usuário "user-name" preenchendo com usuário válido
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER-NAME}
    Input Text  id=${USER-NAME}     ${user_data.homol.user_name}


Clicar no campo de senha "password" preenchendo com senha válida
    # Element Should Be Visible    id=${PASSWORD}
    Click Element  id=${KEY-PASSWORD}
    Input Text  id=${KEY-PASSWORD}      ${user_data.homol.password}

Clicar no botão login "login-button"
    Click Element    id=${LOGIN_BUTTON}
    Sleep   5s

Clicar no campo de usuário "user-name" preenchendo com usuário bloqueado
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER-NAME}
    Input Text  id=${USER-NAME}     ${user_data.homol.blocked_user}

Verificar se a mensagem de erro "Epic sadface: Sorry, this user has been locked out." é exibida
    Wait Until Page Contains            ${ERROR_MESSAGE_BLOCKED}
    Element Should Be Visible           ${ERROR_MESSAGE_LOCATOR} 


Login como usuário válido
    Acessar a home page do site "Swag Labs"
    Clicar no campo de usuário "user-name" preenchendo com usuário válido
    Clicar no campo de senha "password" preenchendo com senha válida
    Clicar no botão login "login-button"