*** Settings ***
Library    AppiumLibrary
Resource    ../../robot-appium/pageObject/keyword/common.resource


*** Variables ***
${APPIUM_SERVER_URL}    http://127.0.0.1:4723

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
    Sleep    5s
    Open Hamburger Menu
    [Teardown]    Close Application