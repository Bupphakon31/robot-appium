*** Settings ***
Library    AppiumLibrary
Resource   ../locators/login_locators.resource

*** Keywords ***

Verify Login Page Is Displayed
    [Documentation]    Verify that the login page is displayed by checking the presence of key elements.
    [Arguments]    &{expectedResult}
    Wait Until Element Is Visible    ${login_page}[title]
    Wait Until Element Is Visible    ${login_page}[description]
    Wait Until Element Is Visible    ${login_page}[username_label]
    Wait Until Element Is Visible    ${login_page}[username_field]
    Wait Until Element Is Visible    ${login_page}[password_label]
    Wait Until Element Is Visible    ${login_page}[password_field]
    Wait Until Element Is Visible    ${login_page}[login_button]
    Element Text Should Be           ${login_page}[title]                  ${expectedResult}[title]
    Element Text Should Be           ${login_page}[description]            ${expectedResult}[description]
    Element Text Should Be           ${login_page}[username_label]         ${expectedResult}[username_label]
    Element Text Should Be           ${login_page}[password_label]         ${expectedResult}[password_label]
    Element Text Should Be           ${login_page}[text_login_button]      ${expectedResult}[login_button]

Fill Login Form
    [Documentation]    Fill in the login form with the provided username and password.
    [Arguments]    ${username}    ${password}
    Input Text    ${login_page}[username_field]    ${username}
    Input Text    ${login_page}[password_field]    ${password}

Click login button
    Click Element    ${login_page}[login_button]