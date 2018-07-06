*** Settings ***
Documentation     A test suite with a single test for Open Page.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resources/resource.robot

*** Test Cases ***
Open Page
    Open Browser To Welcome Page
    Welcome Page Should Be Open
    [Teardown]    Close Browser