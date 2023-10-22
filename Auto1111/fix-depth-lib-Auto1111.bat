:: by alexbofa
:: Homepage: https://github.com/alexbofa/BATNIKI
:: Telegram: @bofacosy

@echo off
chcp 65001>null
color 0F
del null

if not exist extensions\sd-webui-depth-lib (
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

RMDIR /s/q extensions\sd-webui-depth-lib\maps\hands\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_01\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_02\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_03\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_04\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_05\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_07\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_09\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_11\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_12\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_17\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_20\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_23\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_27\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_34\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_38\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_43\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_49\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_50\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_53\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_54\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_58\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_62\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_63\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_72\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_73\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_74\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\pp_hands_75\tmp
RMDIR /s/q extensions\sd-webui-depth-lib\maps\shapes\tmp