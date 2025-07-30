*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BNT_CHECKOUT}   id=checkout
${TXT_CHECKOUT_INFO}   xpath=//*[text()="Checkout: Your Information"]
${BNT_CONTINUE}   id=continue
${TXT_ERROR_FIRST_NAME}   xpath=//h3[contains(text(), "Error: First Name is required")]
${TXT_ERROR_LAST_NAME}   xpath=//h3[contains(text(), "Error: Last Name is required")]
${TXT_ERROR_POSTAL_CODE}   xpath=//h3[contains(text(), "Error: Postal Code is required")]
${BNT_FIRST_NAME}   id=first-name
${BNT_LAST_NAME}   id=last-name
${BNT_POSTAL_CODE}   id=postal-code
${TXT_FIRST_NAME}   Test
${TXT_LAST_NAME}   User
${TXT_POSTAL_CODE}   12345
${TXT_CHECKOUT_OVERVIEW}   xpath=//*[text()="Checkout: Overview"]
${BNT_FINISH}   id=finish
${TXT_THANK_YOU_FOR_YOUR_ORDER}   xpath=//*[text()="Thank you for your order!"]
${BNT_BACK_HOME}   id=back-to-products