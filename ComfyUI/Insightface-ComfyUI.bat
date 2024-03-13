:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI

@echo off
chcp 65001
color 0F
cls

set APPDATA=tmp
set USERPROFILE=tmp
set TEMP=tmp

if exist web\extensions\core (
	color C0
	echo.
	echo     Переложи Insightface-ComfyUI.bat на папку выше ComfyUI_windows_portable
	echo     Рядом с файлом run_nvidia_gpu.bat и python_embeded
	echo.
	echo     Если такого файла и папки нет, то установи Portable ComfyUI 
	echo     https://github.com/comfyanonymous/ComfyUI/releases/
	echo.
	pause
	exit
)

if not exist python_embeded (
	color C0
	echo.
	echo     Установи Portable ComfyUI 
	echo     https://github.com/comfyanonymous/ComfyUI/releases/
	echo.
	pause
	exit
)

if not exist git (
	echo.
	echo     GIT не найден, идёт загрузка...
	echo.
  
	curl -L -o git.zip https://github.com/alexbofa/BATNIKI/releases/download/assets/git.zip

	echo.
	echo     Распаковка GIT в папку...
	echo.
	tar -xf git.zip
	del git.zip /q
)

	echo.
	echo     У вас установлен Portable ComfyUI
	echo     Установка comfyui-reactor-node будет произведена для Portable
	echo.
	pause
  
    python_embeded\python.exe -m pip uninstall -y opencv-contrib-python opencv-python-headless onnxruntime-gpu
if exist "python_embeded\python310.dll" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
    python_embeded\python.exe -m pip install opencv-python==4.7.0.72
) else if exist "python_embeded\python311.dll" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp311-cp311-win_amd64.whl
    python_embeded\python.exe -m pip install opencv-python==4.8.1.78
) else if exist "python_embeded\python312.dll" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp312-cp312-win_amd64.whl
    python_embeded\python.exe -m pip install opencv-python==4.8.1.78
) else (
	cls
    echo У тебя что-то не так с python_embeded, советую перекачать заново и повторить действия
	pause
)
  python_embeded\python.exe -m pip install onnxruntime==1.15.1
  python_embeded\python.exe -m pip install --upgrade pip
  
RMDIR /s/q pip 
cls
echo.
echo     Готовченко
echo.
echo     Если есть вопросы/проблемы пишите в issue:
echo     https://github.com/alexbofa/BATNIKI
echo.
echo     Discord: @alexbofa
echo.
pause
