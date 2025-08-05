*** Settings ***
Library           SeleniumLibrary
Variables         ../data_pool/DataPool_login.yaml

*** Variables ***
${TITLE}                       Swag Labs
${USER-NAME}                   user-name
${KEY-PASSWORD}                password
${LOGIN_BUTTON}                login-button
${POPUP_OK_BUTTON}             xpath=//button[text()="OK"]
${ERROR_MESSAGE_BLOCKED}       text=Epic sadface: Sorry, this user has been locked out.
${ERROR_MESSAGE_LOCATOR}       xpath=//h3[@data-test='error']