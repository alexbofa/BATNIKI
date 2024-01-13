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
	echo     После завершения установки вернитесь к TensorRT-Auto1111.bat
	echo.
	pause
	exit
)

IF EXIST git (
    IF EXIST python (
	    echo.
        echo     У вас установлен Portable Stable Diffusion
		echo     Установка компонентов TensorRT будет произведена для Portable
		echo.
		pause
		cd extensions
		RMDIR /s/q Stable-Diffusion-WebUI-TensorRT
		RMDIR /s/q Stable-Diffusion-WebUI-TensorRT-main
		..\git\bin\git.exe clone https://github.com/NVIDIA/Stable-Diffusion-WebUI-TensorRT.git
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
	cd extensions
	RMDIR /s/q Stable-Diffusion-WebUI-TensorRT
	RMDIR /s/q Stable-Diffusion-WebUI-TensorRT-main
	git clone https://github.com/NVIDIA/Stable-Diffusion-WebUI-TensorRT.git
	cd ..
)

call venv\scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install nvidia-cudnn-cu11==8.9.4.25 --no-cache-dir
python -m pip install --pre --extra-index-url https://pypi.nvidia.com/ tensorrt==9.0.1.post11.dev4 --no-cache-dir
python -m pip install polygraphy --extra-index-url https://pypi.ngc.nvidia.com
python -m pip install protobuf==3.20.2
python -m pip install onnx-graphsurgeon --extra-index-url https://pypi.ngc.nvidia.com
python -m pip install onnx
python -m pip install colored
python -m pip install onnxruntime
python -m pip uninstall -y nvidia-cudnn-cu11
pause
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
