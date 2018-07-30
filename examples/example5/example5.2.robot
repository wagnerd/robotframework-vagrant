*** Settings ***

*** Variables ***

*** Test Cases ***
Failing Example
    Strings Should Be Equal    Hello    Hello
    Strings Should Be Equal    not      equal

Good Example
    Strings Should Be Equal    Hello    Hello