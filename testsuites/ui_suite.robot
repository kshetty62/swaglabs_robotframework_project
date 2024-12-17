*** Settings ***
Suite Setup     Open Browser    ${BASE_URL}    ${BROWSER}
Suite Teardown  Close Browser
Resource        ../resources/variables.robot
Test Template   Run Test

*** Test Cases ***
Login Test Suite
    Verify Login Functionality
