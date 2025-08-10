*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String

*** Variables ***
${DIR_EVIDENCIAS}        ${EXECDIR}${/}evidencias
${CONTADOR_PASSO}         0

*** Keywords ***
# --- Keywords de Configuração (Setup e Teardown) ---

Preparar Ambiente Para Evidencias
    [Documentation]     Cria a pasta para salvar as screenshots, se não existir.
    Remove Directory       ${DIR_EVIDENCIAS}    recursive=True
    Create Directory       ${DIR_EVIDENCIAS}

Finalizar e Gerar PDF de Evidencias
    [Documentation]   Fecha o navegador e executa o script Python para gerar o PDF.
    Close Browser
    Log To Console   \n--- Gerando PDF de evidências... ---
    Run    python gerar_pdf_evidencias.py

Capturar Tela e Incrementar Passo
    [Arguments]    ${nome_do_passo_de_negocio}
    [Documentation]    Incrementa, tira screenshot e loga com o nome do passo de negócio.
    ${novo_contador}=    Evaluate    ${CONTADOR_PASSO} + 1
    Set Suite Variable    ${CONTADOR_PASSO}    ${novo_contador}
    ${contador_formatado}=    Convert To String    ${CONTADOR_PASSO}
    ${nome_arquivo}=        Set Variable    passo_${contador_formatado.zfill(3)}.png
    ${path_completo}=      Capture Page Screenshot    ${DIR_EVIDENCIAS}${/}${nome_arquivo}
    Log    EVIDENCIA: ${nome_do_passo_de_negocio} | ${path_completo}    level=INFO