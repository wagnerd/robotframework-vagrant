*** Settings ***
# Resource    resources/extra_vars.resource #  Robot Framework 3.1
Resource    resources/extra_vars.robot

*** Variables ***
${HOST}           localhost:7272
${LOGIN URL}      http://${HOST}/
${WELCOME URL}    http://${HOST}/welcome.html
${BROWSER}        Firefox

*** Test Cases ***
Compare Intern and Extern Vars rbot file
    Should Be Equal    ${HOST}      ${EXTRA_HOST}
    Should Be Equal    ${LOGIN URL}      ${EXTRA_LOGIN URL}
    Should Be Equal    ${WELCOME URL}     ${EXTRA_WELCOME URL}
    Should Be Equal    ${BROWSER}      ${EXTRA_BROWSER}

Good Example
    Should Be Equal    Hello    Hello