*** Settings ***
Library       Remote    http://${ADDRESS}:${PORT}

*** Variables ***
${ADDRESS}    10.0.2.2
${PORT}       8270
${HOSTDIR1}    E:\\
${HOSTDIR2}    F:\\

*** Test Cases ***
Count Items in Directory Guest
    ${items1} =    Count Items In Directory    ${CURDIR}
    ${items2} =    Count Items In Directory    ${TEMPDIR}
    Log    ${items1} items in '${CURDIR}' and ${items2} items in '${TEMPDIR}'

Count Items in Directory Host
    ${items1} =    Count Items In Directory    ${HOSTDIR1}
    ${items2} =    Count Items In Directory    ${HOSTDIR2}
    Log    ${items1} items in '${HOSTDIR1}' and ${items2} items in '${HOSTDIR2}'

Failing Example
    Strings Should Be Equal    Hello    Hello
    Strings Should Be Equal    not      equal
