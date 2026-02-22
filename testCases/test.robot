*** Settings ***
Library    AppiumLibrary
Resource    ../pageObject/keyword/common.resource
Resource    ../pageObject/keyword/login_keyword.resource
Suite Setup    Setup Expected Page Data
Suite Teardown    Close Application

*** Variables ***
${APPIUM_SERVER_URL}    http://127.0.0.1:4723
${USERNAME}    bob@example.com
${PASSWORD}    10203040


#Android Capabilities
${ANDROID_APP}    ${CURDIR}/../app/myDemoAppRN.1.3.0.build-244.apk
${ANDROID_DEVICE}    emulator-5554

*** Test Cases ***
Launch Android App
    Open Application    ${APPIUM_SERVER_URL}
    ...    platformName=Android
    ...    deviceName=${ANDROID_DEVICE}
    ...    app=${ANDROID_APP}
    ...    automationName=UiAutomator2
    Sleep    2s
    Open Hamburger Menu
    Click Login menu
    
    Verify Login Page Is Displayed    &{EXPECTED_LOGIN_PAGE}
    Fill Login Form    ${USERNAME}    ${PASSWORD}
    Click login button
