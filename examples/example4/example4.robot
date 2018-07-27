*** Settings ***
Documentation     A test suite with a single test for a custom library.
...
Library    scripts/ExampleLibrary.py

*** Test Cases ***
Counting
    COUNT
    COUNT
    CLEAR COUNTER