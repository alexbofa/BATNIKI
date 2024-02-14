:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI

@echo off
chcp 65001
color 0F
cls
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

 if exist stablediff.ico (
		color C0
		echo.
		echo     Вы пользуетесь сборкой от StableDiff
		echo     Которая, по заверению автора, включает в себя Reactor и FaceSwapLab
		echo.
		echo     Обращайтесь к автору сборки
		echo     Либо установите Portable Stable Diffusion и возвращайтесь к этому батнику
		echo     Скачать: https://github.com/serpotapov/stable-diffusion-portable
		echo.
		pause
		exit
) 
cls
:start
echo.
echo     Доступные команды:
echo     1. Установить Reactor
echo     2. Установить FaceSwapLab
echo     3. Установить оба расширения
echo     4. Установить только модуль Insightface
echo     5. Выход
echo.
set /p choice=Введите номер команды и нажмите Enter: 

if '%choice%'=='' goto didntchoose
if '%choice%'=='1' goto sd-webui-reactor
if '%choice%'=='2' goto sd-webui-faceswaplab
if '%choice%'=='3' goto all-extentions
if '%choice%'=='4' goto insightface
if '%choice%'=='5' goto exit

:didntchoose
cls
echo.
echo     Вы не выбрали номер команды, попробуйте ещё раз
goto start

:sd-webui-reactor
IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка Reactor будет произведена для Portable
		echo.
		echo     ВНИМАНИЕ! FaceSwapLab будет удалён
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
		goto pipinstall
							)
				) else (
    echo.
    echo     У вас установлена стандартная версия Stable Diffusion
	echo     Установка Reactor будет выполнена для стандартной версии
	echo     GIT и PYTHON должны быть установлены отдельно
	echo.
	echo     Лучше всего поспользоваться Portable Stable Diffusion
	echo     Скачать: https://github.com/serpotapov/stable-diffusion-portable
	echo     Установка всё равно будет проделана, нажмите Enter
	echo.
	echo     ВНИМАНИЕ! FaceSwapLab будет удалён
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
	goto pipinstall
)

:sd-webui-faceswaplab
IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка FaceSwapLab будет произведена для Portable
		echo.
		echo     ВНИМАНИЕ! Reactor будет удалён
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
        ..\git\bin\git.exe clone https://github.com/glucauze/sd-webui-faceswaplab.git
        cd ..
        set appdata=tmp
        set userprofile=tmp
        set temp=tmp
        set path=git\cmd;python;venv\scripts
		goto pipinstall
							)
				) else (
    echo.
    echo     У вас установлена стандартная версия Stable Diffusion
	echo     Установка FaceSwapLab будет выполнена для стандартной версии
	echo     GIT и PYTHON должны быть установлены отдельно
	echo.
	echo     Лучше всего поспользоваться Portable Stable Diffusion
	echo     Скачать: https://github.com/serpotapov/stable-diffusion-portable
	echo     Установка всё равно будет проделана, нажмите Enter
	echo.
	echo     ВНИМАНИЕ! Reactor будет удалён
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
    git clone https://github.com/glucauze/sd-webui-faceswaplab.git
    cd ..
	goto pipinstall
)

:all-extentions
IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка Reactor и FaceSwapLab будет произведена для Portable
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
        ..\git\bin\git.exe clone https://github.com/glucauze/sd-webui-faceswaplab.git
		..\git\bin\git.exe clone https://github.com/Gourieff/sd-webui-reactor.git
        cd ..
        set appdata=tmp
        set userprofile=tmp
        set temp=tmp
        set path=git\cmd;python;venv\scripts
		goto pipinstall
							)
				) else (
    echo.
    echo     У вас установлена стандартная версия Stable Diffusion
	echo     Установка Reactor и FaceSwapLab будет выполнена для стандартной версии
	echo     GIT и PYTHON 3.10 должны быть установлены отдельно
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
    git clone https://github.com/glucauze/sd-webui-faceswaplab.git
	git clone https://github.com/Gourieff/sd-webui-reactor.git
    cd ..
	goto pipinstall
)

:insightface
IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка модуля Insightface будет произведена для Portable
		echo.
		pause
        set appdata=tmp
        set userprofile=tmp
        set temp=tmp
        set path=git\cmd;python;venv\scripts
		call venv\scripts\activate.bat
		pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
							)
				) else (
    echo.
    echo     У вас установлена стандартная версия Stable Diffusion
	echo     Установка модуля Insightface будет выполнена для стандартной версии
	echo     PYTHON 3.10 должен быть установлен отдельно
	echo.
	echo     Лучше всего поспользоваться Portable Stable Diffusion
	echo     Скачать: https://github.com/serpotapov/stable-diffusion-portable
	echo     Установка всё равно будет проделана, нажмите Enter
	echo.
	pause
	call venv\scripts\activate.bat
	pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
)

:pipinstall
call venv\scripts\activate.bat
pip uninstall -y onnx onnxruntime onnxruntime-gpu onnxruntime-silicon
pip install https://github.com/Gourieff/Assets/raw/main/Insightface/insightface-0.7.3-cp310-cp310-win_amd64.whl
pip install open-clip-torch==2.15.0
python.exe -m pip install --upgrade pip
goto finish

:finish
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
