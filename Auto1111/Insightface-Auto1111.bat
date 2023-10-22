:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI
:: Telegram: @bofacosy

@echo off
chcp 65001>null
color 0F
del null

if not exist venv (
	color C0
	echo.
	echo     Ты точно там запускаешь?
	echo.
	echo     Класть батник нужно в корень Stable Diffusion
	echo     Рядом с webui-user.bat
	echo.
	pause
	exit
)

if not exist venv\scripts\activate.bat (
	color C0
	echo.
	echo     Возникла проблема с venv
	echo.
	echo     Удалите каталог venv и запустите webui-user.bat для установки компонентов
	echo     После завершения установки вернитесь к Insightface-Auto1111.bat
	echo.
	pause
	exit
)

IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка sd-webui-REACTOR будет произведена для Portable
		echo.
		pause
		RMDIR /s/q venv\Lib\site-packages\google\~protobuf
        cd extensions
		RMDIR /s/q sd-webui-roop
		RMDIR /s/q sd-webui-roop-main
		RMDIR /s/q sd-webui-roop-nsfw
		RMDIR /s/q sd-webui-roop-nsfw-main
		RMDIR /s/q sd-webui-reactor
		RMDIR /s/q sd-webui-reactor-main
		RMDIR /s/q sd-webui-faceswaplab
		RMDIR /s/q sd-webui-faceswaplab-main
        ..\git\bin\git.exe clone https://github.com/Gourieff/sd-webui-reactor.git
        cd ..
        set appdata=tmp
        set userprofile=tmp
        set temp=tmp
        set path=git\cmd;python;venv\scripts
							)
				) else (
    echo.
    echo     У вас установлена стандартная версия Stable Diffusion
	echo     Установка компонентов TensorRT будет выполнена для стандартной версии
	echo     GIT и PYTHON должны быть установлены отдельно
	echo.
	echo     Лучше всего поспользоваться Portable Stable Diffusion
	echo     Скачать: https://github.com/serpotapov/stable-diffusion-portable
	echo     Установка всё равно будет проделана, нажмите Enter
	echo.
	pause
	RMDIR /s/q venv\Lib\site-packages\google\~protobuf
    cd extensions
	RMDIR /s/q sd-webui-roop
	RMDIR /s/q sd-webui-roop-main
	RMDIR /s/q sd-webui-roop-nsfw
	RMDIR /s/q sd-webui-roop-nsfw-main
	RMDIR /s/q sd-webui-reactor
	RMDIR /s/q sd-webui-reactor-main
	RMDIR /s/q sd-webui-faceswaplab
	RMDIR /s/q sd-webui-faceswaplab-main
    git clone https://github.com/Gourieff/sd-webui-reactor.git
    cd ..
)

call venv\scripts\activate.bat
pip uninstall -y onnx onnxruntime onnxruntime-gpu onnxruntime-silicon
pip install https://github.com/Gourieff/sd-webui-reactor/raw/main/example/insightface-0.7.3-cp310-cp310-win_amd64.whl
pip install open-clip-torch==2.15.0
cd extensions/sd-webui-reactor
pip install -r requirements.txt
python.exe -m pip install --upgrade pip

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