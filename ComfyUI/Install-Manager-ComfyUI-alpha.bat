:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI

@echo off
chcp 65001
color 0F
cls
for /f "tokens=3" %%i in ('reg query "HKCU\Control Panel\Desktop" /v "PreferredUILanguages"') do set UILanguage=%%i

if exist web\extensions\core (
color C0
echo.
echo     Переложи Install-Manager-ComfyUI.bat на папку выше ComfyUI_windows_portable
echo     Рядом с файлом run_nvidia_gpu.bat и python_embeded
echo.
echo     Если такого файла и папки нет, то установи Portable ComfyUI 
echo     ComfyUI_windows_portable_nvidia_cu121_or_cpu.7z
echo     https://github.com/comfyanonymous/ComfyUI/releases/
echo.
pause
exit
)

if not exist python_embeded (
color C0
echo.
echo     Переложи Install-Manager-ComfyUI.bat
echo     Рядом с файлом run_nvidia_gpu.bat и python_embeded
echo.
echo     Если такого файла и папки нет, то установи Portable ComfyUI 
echo     ComfyUI_windows_portable_nvidia_cu121_or_cpu.7z    
echo     https://github.com/comfyanonymous/ComfyUI/releases/
echo.
pause
exit
)

if not exist "python_embeded" (
color C0
echo.
echo     У тебя установлен не тот ComfyUI
echo.
echo     Для лучше работы скачайте Portable ComfyUI с Python 3.11, Pytorch 2.1 и cuDNN 12.1
echo.
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
set path=%~dp0git\cmd;python_embeded
set git=%~dp0git\cmd\git.exe

if "%UILanguage%"=="ru-RU" (
goto startru
) else (
goto start
)


:startru
cls
echo.
echo     Доступные команды:
echo     1. Установка только Manager и компонентов
echo.
echo     2. pip install
echo     3. pip uninstall
echo     4. Какая стоит версия модуля?
echo     5. Показать все версии модулей
echo.
echo     6. Установка xformers 0.0.24
echo     7. Установка xformers 0.0.25.dev741
echo     8. Жёсткое обновление ComfyUI и custom_nodes
echo.
echo     0. Выход
echo.
set /p choice=Введите номер команды и нажмите Enter: 
goto choiceru

:start
cls
echo.
echo     Available commands:
echo     1. Installing only Manager and components
echo.
echo     2. pip install
echo     3. pip uninstall
echo     4. What is the version of the module?
echo     5. Show all versions of modules
echo.
echo     6. Install xformers 0.0.24
echo     7. Install xformers 0.0.25.dev741
echo     8. Hard update of ComfyUI and custom_nodes
echo.
echo     0. Exit
echo.
set /p choice=Enter the command number and press Enter: 
goto choice

:choiceru
if '%choice%'=='' goto didntchoose
if '%choice%'=='1' goto manager
if '%choice%'=='2' goto pipinstall
if '%choice%'=='3' goto pipuninstall
if '%choice%'=='4' goto whatversionmodule
if '%choice%'=='5' goto piplist
if '%choice%'=='6' goto xformers
if '%choice%'=='7' goto xformersdev
if '%choice%'=='8' goto updatehard
if '%choice%'=='0' goto exit

:choice
if '%choice%'=='' goto didntchoose
if '%choice%'=='1' goto manager
if '%choice%'=='2' goto pipinstall
if '%choice%'=='3' goto pipuninstall
if '%choice%'=='4' goto whatversionmodule
if '%choice%'=='5' goto piplist
if '%choice%'=='6' goto xformers
if '%choice%'=='7' goto xformersdev
if '%choice%'=='8' goto updatehard
if '%choice%'=='0' goto exit

:didntchoose
cls
echo.
echo     Вы не выбрали номер команды, попробуйте ещё раз
goto start

:manager
cd ComfyUI\custom_nodes
RMDIR /s/q ComfyUI-Manager
RMDIR /s/q ComfyUI-Manager-main
..\..\git\cmd\git.exe config --global http.sslVerify false
..\..\git\cmd\git.exe clone https://github.com/ltdrdata/ComfyUI-Manager
..\..\git\cmd\git.exe clone https://github.com/Fannovel16/comfyui_controlnet_aux.git
cd ..
cd ..
if exist "python_embeded\Scripts\pip3.10.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
) else if exist "python_embeded\Scripts\pip3.11.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp311-cp311-win_amd64.whl
) else if exist "python_embeded\Scripts\pip3.12.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp312-cp312-win_amd64.whl
) else if exist "python_embeded\Scripts\pip3.13.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp313-cp313-win_amd64.whl
) else (
	color C0
	cls
	echo.
    echo     У тебя что-то не так с python_embeded, советую перекачать заново и повторить действия
	echo.
	pause
	exit
)
python_embeded\python.exe -m pip install opencv-python==4.8.1.78
python_embeded\python.exe -m pip install segment-anything
python_embeded\python.exe -m pip install omegaconf
python_embeded\python.exe -m pip install gray2color
python_embeded\python.exe -m pip install --upgrade pip  
pause
goto finish

:pipinstall
cls
echo.
echo Введите имя модуля который хотите установить
set /p MODULE="Например GitPython или opencv-python==4.8.1.78: "
cls
echo.
python_embeded\python.exe python_embeded\Scripts\pip.exe install %MODULE%
echo.
pause
goto start

:pipuninstall
cls
echo.
echo Введите имя модуля который хотите удалить
set /p MODULE="Например xformers или opencv-python==4.9.0.80: "
cls
echo.
python_embeded\python.exe python_embeded\Scripts\pip.exe uninstall -y %MODULE%
echo.
pause
goto start

:whatversionmodule
cls
echo.
echo Введите имя модуля для проверки версии
set /p module="Например cv2, torchaudio или torchvision: "
cls
echo.
python_embeded\python.exe -c "import %module%; print('%module% = ' + %module%.__version__)"
echo.
pause
goto start

:piplist
cls
echo.
python_embeded\python.exe -m pip list
echo.
pause
goto start

:xformers
python_embeded\python.exe python_embeded\Scripts\pip.exe install mmcv==2.1.0 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0/index.html
::python_embeded\python.exe python_embeded\Scripts\pip.exe install https://huggingface.co/r4ziel/xformers_pre_built/resolve/main/triton-2.0.0-cp310-cp310-win_amd64.whl
python_embeded\python.exe python_embeded\Scripts\pip.exe install torchvision==0.17.0
python_embeded\python.exe python_embeded\Scripts\pip.exe install torchaudio==2.2.0
python_embeded\python.exe python_embeded\Scripts\pip.exe install torch==2.2.0+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
python_embeded\python.exe python_embeded\Scripts\pip.exe install xformers==0.0.24
python_embeded\python.exe python_embeded\Scripts\pip.exe install --upgrade pip
pause
goto finish

:xformersdev
python_embeded\python.exe python_embeded\Scripts\pip.exe install mmcv==2.1.0 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0/index.html
::python_embeded\python.exe python_embeded\Scripts\pip.exe install https://huggingface.co/r4ziel/xformers_pre_built/resolve/main/triton-2.0.0-cp310-cp310-win_amd64.whl
python_embeded\python.exe python_embeded\Scripts\pip.exe install torchvision==0.17.0
python_embeded\python.exe python_embeded\Scripts\pip.exe install torchaudio==2.2.0
python_embeded\python.exe python_embeded\Scripts\pip.exe install torch==2.2.0+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
python_embeded\python.exe python_embeded\Scripts\pip.exe install xformers==0.0.25.dev741
python_embeded\python.exe python_embeded\Scripts\pip.exe install --upgrade pip
pause
goto finish

:updatehard
cls
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
git reset --hard
git pull origin master
cd ..
echo ---

cd ComfyUI\custom_nodes
call :colored custom_nodes Blue
git reset --hard
git pull
echo ---

for /D %%i in (*) do (
    call :colored %%i Green
    cd "%%i"
	git reset --hard
    git pull
	echo ---
    cd ..
)

cd /d "%~dp0"
pause
goto finish

:finish
RMDIR /s/q pip
cls
echo.
echo     Готовченко
echo.
echo     Если есть вопросы/проблемы пишите в issue:
echo     https://github.com/alexbofa/BATNIKI
echo.
echo     Обучение ComfyUI
echo     Discord: @alexbofa
echo.
pause
goto start

:colored

%Windir%\System32\WindowsPowerShell\v1.0\Powershell.exe write-host -foregroundcolor %2 %1
