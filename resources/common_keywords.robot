*** Settings ***
Library    String



*** Keywords ***
Convert To Hyphenated Lowercase
    [Arguments]    ${input_string}
    ${string}=    Evaluate    '${input_string.lower().replace(" ", "-")}'    # Inline Python code
    RETURN    ${string}
