@echo off
cd /d %~dp0

echo Cleaning old Allure results...
rmdir /s /q reports\web\allure-results

set ENV=%1

if "%ENV%"=="" set ENV=dev


echo Running Robot tests...
robot ^
  --variablefile variables\env_%ENV%.yaml ^
  --outputdir reports\web\robot ^
  --listener allure_robotframework:reports\web\allure-results ^
  tests\web\playwright\Register.robot

echo Opening Allure report...
allure serve reports\web\allure-results

pause
