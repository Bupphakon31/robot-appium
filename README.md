# Robot Framework + Appium Setup (Windows)## ติดตั้ง Python Packages / Install Python Packages

```bash
python -m pip install -r requirements.txt
```

(Alternatively install individually:)

```bash
python -m pip install robotframework
python -m pip install robotframework-appiumlibrary
python -m pip install pyyaml
```

## ติดตั้ง Appium / Install Appium

```bash
npm install -g appium
```

### แก้ปัญหา Appium ไม่เจอ (ถ้ามี) / Fix "Appium not found" issue (if needed)

Add npm directory to your PATH:

```powershell
[System.Environment]::SetEnvironmentVariable('Path', [System.Environment]::GetEnvironmentVariable('Path','User') + ";$env:APPDATA\npm", 'User')
```

Then restart PowerShell.

## Setup Environment Variables (PowerShell) / ตั้งค่าตัวแปรสภาพแวดล้อม

### 1. ตั้งค่า ANDROID_HOME / Set ANDROID_HOME

```powershell
[System.Environment]::SetEnvironmentVariable('ANDROID_HOME', "$env:LOCALAPPDATA\Android\Sdk", 'User')
```

### 2. เพิ่ม Android SDK paths เข้า PATH / Add SDK paths to PATH

```powershell
$currentPath = [System.Environment]::GetEnvironmentVariable('Path','User')
$newPath = "$currentPath;$env:ANDROID_HOME\platform-tools;$env:ANDROID_HOME\tools;$env:ANDROID_HOME\tools\bin;$env:ANDROID_HOME\emulator"
[System.Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
```

### 3. รีเฟรช Environment Variables / Refresh variables

```powershell
$env:ANDROID_HOME = [System.Environment]::GetEnvironmentVariable('ANDROID_HOME','User')
$env:Path = [System.Environment]::GetEnvironmentVariable('Path','User')
```

### 4. เช็คว่าตั้งค่าสำเร็จ / Verify setup

```powershell
$env:ANDROID_HOME
adb version
```

## เช็คการติดตั้ง / Verify installation

```bash
robot --version
python -m pip show robotframework-appiumlibrary
appium --version
```

## โครงสร้างโปรเจค / Project Structure (โครงสร้างโปรเจค)

```
robot-appium/
├── testCases/                    # Test cases
│   └── test_example.robot
├── pageObject/
│   ├── keyword/                  # Keywords
│   │   └── common.resource
│   └── locators/                 # Locators
├── resources/
│   ├── dataTest/                 # Test data
│   └── expected/                 # Expected results
├── results/                      # Test results
├── config.yaml                   # Appium capabilities
├── globalVariables.resource      # Global variables (e.g. ${ANDROID_APP})
├── requirements.txt              # Python dependencies
└── README.md
```


## วิธีรัน Test / How to Run Tests

**Terminal 1 - เปิด Appium Server / Start Appium server:**
```bash
appium
```

**Terminal 2 - เช็ค Device / Check connected devices:**
```bash
adb devices
```

**Terminal 2 - รัน Test / Run a test:**
```bash
robot -d results testCases/test_example.robot
```

หรือรันทุก test / or run all tests:
```bash
robot -d results testCases/
```
### APK Configuration / ตั้งค่าตำแหน่ง APK

Before running tests you must point `${ANDROID_APP}` to your Android package. Open **`globalVariables.resource`** or **`test_settings.robot`** and set:

```robot
${ANDROID_APP}    path/to/your/app.apk
```

You can use a relative path (the file in the project root) or an absolute path. This variable is used by the `Open Application` keyword when launching the app.

---

### ดูผลลัพธ์ / View Results

เปิดไฟล์ `results/report.html` ใน browser

/Open `results/report.html` in a browser to view the report.