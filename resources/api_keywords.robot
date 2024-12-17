








*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Maximize Browser Window

Enter Credentials
    Input Text    id:username    ${USERNAME}
    Input Text    id:password    ${PASSWORD}

Click Login
    Click Button    id:loginButton

Verify Dashboard
    Element Should Be Visible    xpath=//h1[text()='Dashboard']
