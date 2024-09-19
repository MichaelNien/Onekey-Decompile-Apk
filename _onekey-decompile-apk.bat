@echo off
echo ==================================
echo Onekey Decompile Apk
echo v2.10.0 20240917
echo Based on https://code.google.com/p/onekey-decompile-apk/
echo **********************************
echo How to use
echo ------------------------------------
echo 1. Put your apk in this folder
echo 2. Drag the apk on _onekey-decompile-apk.bat
echo 3. Wait for invoking jd-gui, "File"-"Save All Sources"
echo 4. Folder and apk with the same name is what you needed
echo ==================================

set apkFile=%1
set jarFile=%~dpn1.jar
rem change directory to apk folder
cd /d "%~dp1"
rem delete previous generation
rd /s /q "%~dpn1" >NUL 2>NUL

echo .........del temp..........
del /Q /S "%~dp0\_temp"
echo .........apktool..........
java -jar "_tools\apktool\apktool_2.10.0.jar" d "%apkFile%" -p "%~dp0\_temp\apktool" -f
echo .........dex2jar..........
call _tools\dex2jar\d2j-dex2jar -f "%apkFile%" -o "%jarFile%"
echo .........jd-gui...........
call _tools\jd-gui\jd-gui "%jarFile%"

rem delete the jar
pause
::del /q "%jarFile%" >NUL 2>NUL
