*** Settings ***
Library           SeleniumLibrary
Resource          ../pages/PO_login.robot
Variables         ../data_pool/DataPool_login.yaml
Resource          ../libs/captura-tela.robot

*** Keywords ***
Acessar a home page do site "Swag Labs"
    Go To  url=${URL.homol}
    # Wait Until Element Is Visible    locator=${TITULO_LOGIN}
    Wait Until Page Contains    text=${TITLE}
    Capturar Tela e Incrementar Passo    "Acessar a home page do site 'Swag Labs'"

Clicar no campo de usuário "user-name" preenchendo com usuário válido
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER-NAME}
    Input Text  id=${USER-NAME}     ${user_data.homol.user_name}
    Capturar Tela e Incrementar Passo    "Clicar no campo de usuário 'user-name' e preencher com usuário válido"

Clicar no campo de senha "password" preenchendo com senha válida
    # Element Should Be Visible    id=${PASSWORD}
    Click Element  id=${KEY-PASSWORD}
    Input Text  id=${KEY-PASSWORD}      ${user_data.homol.password}
    Capturar Tela e Incrementar Passo    "Clicar no campo de senha 'password' e preencher com senha válida"

Clicar no botão login "login-button"
    Click Element    id=${LOGIN_BUTTON}
    Sleep   5s
    Capturar Tela e Incrementar Passo    "Clicar no botão login 'login-button'"

Clicar no campo de usuário "user-name" preenchendo com usuário bloqueado
    # Element Should Be Visible    id=${USER_NAME}
    Click Element  id=${USER-NAME}
    Input Text  id=${USER-NAME}     ${user_data.homol.blocked_user}
    Capturar Tela e Incrementar Passo    "Clicar no campo de usuário 'user-name' e preencher com usuário bloqueado"

Verificar se a mensagem de erro "Epic sadface: Sorry, this user has been locked out." é exibida
    Sleep    1s
    # Wait Until Page Contains            ${ERROR_MESSAGE_LOCATOR}
    Element Should Be Visible           ${ERROR_MESSAGE_LOCATOR} 
    Capturar Tela e Incrementar Passo    "Verificar mensagem de erro para usuário bloqueado"


Login como usuário válido
    Acessar a home page do site "Swag Labs"
    Clicar no campo de usuário "user-name" preenchendo com usuário válido
    Clicar no campo de senha "password" preenchendo com senha válida
    Clicar no botão login "login-button"