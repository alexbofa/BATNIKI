:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI

@echo off
chcp 65001
color 0F
cls

if not exist python_embeded (
color C0
echo.
echo     Переложи run_gpu_updates_hard.bat
echo     Рядом с файлом run_nvidia_gpu.bat и python_embeded
echo.
echo     Если такого файла и папки нет, то установи Portable ComfyUI 
echo     ComfyUI_windows_portable_nvidia_cu121_or_cpu.7z    
echo     https://github.com/comfyanonymous/ComfyUI/releases/
echo.
pause
exit
)

if not exist git\cmd\git.exe (
echo.
echo     GIT was not found, it is being downloaded...
echo.
  
curl --ssl-no-revoke -L -o git.zip https://github.com/alexbofa/BATNIKI/releases/download/assets/git.zip

echo.
echo     Unpacking the GIT to a folder...
echo.
tar -xf git.zip
del git.zip /q
cls
echo GIT is unpacked
echo.
)

set appdata=tmp
set userprofile=tmp
set temp=tmp
set YOLO_CONFIG_DIR=tmp\YOLO_CONFIG_DIR\
set path=%~dp0git\cmd;python_embeded
set git=%~dp0git\cmd\git.exe

del /q "tmp\tmp*" >nul 2>nul & del /q "tmp\gradio\*.*" >nul 2>nul & rd /s /q "pip\cache" >nul 2>nul & for /d %%x in (tmp\tmp*,tmp\pip*,tmp\gradio\*) do (rd /s /q "%%x" 2>nul || ("%%x" && exit /b 1))

pushd "%~dp0"

cd /d ComfyUI\web\extensions
for /d %%i in (*) do (
    if /i not "%%i"=="core" (
        rd /s /q "%%i"
    )
	)
)

call :colored web\extentions Yellow
echo The folders is cleaned
echo ---
popd

cd /d "%~dp0"

cd ComfyUI
call :colored ComfyUI-Updates Red
git clean -f -d
git reset --hard
git pull origin master
cd ..
echo ---

cd ComfyUI\custom_nodes
call :colored custom_nodes Blue
git clean -f -d
git reset --hard
git pull
echo ---

for /D %%i in (*) do (
    call :colored %%i Green
    cd "%%i"
	git clean -f -d
	git reset --hard
    	git pull
	echo ---
    cd ..
)

cd /d "%~dp0"

.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build

@pause

:colored
%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor %2 %1
