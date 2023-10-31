:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI
:: Telegram: @bofacosy

@echo off
chcp 65001>null
color 0F
del null

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
  
	cd ComfyUI\custom_nodes
	RMDIR /s/q comfyui-reactor-node
	RMDIR /s/q comfyui-reactor-node-main
	..\..\git\cmd\git.exe clone https://github.com/Gourieff/comfyui-reactor-node.git
	cd ..
	cd ..

if exist "python_embeded\Scripts\pip3.10.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
) else if exist "python_embeded\Scripts\pip3.11.exe" (
    python_embeded\python.exe -m pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp311-cp311-win_amd64.whl
) else (
    echo     Не найден pip3.10 и pip3.11
)
  python_embeded\python.exe -m pip uninstall -y opencv-python opencv-contrib-python opencv-python-headless onnxruntime-gpu
  python_embeded\python.exe -m pip install opencv-python==4.7.0.72
  python_embeded\python.exe -m pip install onnxruntime==1.15.1
  python_embeded\python.exe ComfyUI\custom_nodes\comfyui-reactor-node\install.py
  python_embeded\python.exe -m pip install --upgrade pip
  
RMDIR /s/q pip 
cls
echo.
echo     Готовченко
echo.
echo     Если есть вопросы/проблемы пишите в issue:
echo     https://github.com/alexbofa/BATNIKI
echo.
echo     Telegram: @bofacosy
echo     Discord: @alexbofa
echo.
pause