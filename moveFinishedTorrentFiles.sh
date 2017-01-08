#!/bin/bash

DOWNLOAD_COMPLETED_FOLDER=/media/drbergie/0ac9ae61-c9cc-4151-9888-be26c02af604/space/downloads/_completed/
VIDEO_ROOT=/media/drbergie/0ac9ae61-c9cc-4151-9888-be26c02af604/videos/


if [ "$1" = "DC" ]; then
	cd $DOWNLOAD_COMPLETED_FOLDER/DC/
        MOVE_OR_COPY_ARGS=-uv
        MOVE_OR_COPY_ARGS_DIR=-uv
	MOVE_OR_COPY_COMMAND=mv
else
	cd $DOWNLOAD_COMPLETED_FOLDER
        MOVE_OR_COPY_ARGS=-uv
        MOVE_OR_COPY_ARGS_DIR=-uvr
	MOVE_OR_COPY_COMMAND=cp
fi

# TODO case insensitive compare
declare -a pattern=("[Nn]ew*[Gg]irl*" 
	"[Tt]he*[Bb]ig*[Bb]ang*[Tt]heory*"
    "[Gg]reys*[Aa]natomy*"
	"Rizzoli*and*Isles*"
	"South*Park*"
	"Modern*Family*"
	"[Tt]he.[Dd]aily.[Ss]how*"
        "*Q[Ii]*"
	"*Walking*Dead*"
        "*Chicago*Fire*"
        "*Chicago*Med*"
        "*Chicago*PD*"
        "*Knick*"
        "*Reign*"
        "Game*of*Thrones*"
	"Mr*Robot*"
        "[bB]rooklyn*[nN]ine*[nN]ine*"
        "The*Astronaut*Wives*Club*"
    "Code[. ]Black*"
    "Silicon*Valley*"
    "New Girl*"
    "[Tt]he.[Gg]rand.[Tt]our*"
    "[Tt]op[. ][Gg]ear*"
)

declare -a dest=("New girl/" 
	"Big bang theory/"
    "Greys anatomy/"
	"rizzoli & Isles/"
	"south park/"
	"Modern Family/"
	"the daily show/"
    "qi/"
	"the walking dead/"
        "chicago Fire/"
        "chicago med/"
        "chicago pd/"
        "The Knick/"
        "reign/"
        "game of thrones/"
	"mr robot/"
        "Brooklyn nine nine/"
        "The Astronaut Wives Club/"
    "Code Black/"
    "Sillicon valley/"
    "New girl/"
    "the grand tour/"
    "top gear/"
)

#WTF BASH!@@??? http://www.cyberciti.biz/tips/handling-filenames-with-spaces-in-bash.html
#Change the argument seperator to arbiray character. (And restor it later)
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $(seq 0 $((${#pattern[@]} - 1)))
do
   #echo $MOVE_OR_COPY_COMMAND ${pattern[$i]} \"${VIDEO_ROOT}${dest[$i]}\"
   $MOVE_OR_COPY_COMMAND $MOVE_OR_COPY_ARGS ${pattern[$i]} ${VIDEO_ROOT}${dest[$i]}
   $MOVE_OR_COPY_COMMAND $MOVE_OR_COPY_ARGS_DIR ${pattern[$i]} ${VIDEO_ROOT}${dest[$i]}
done
# restore $IFS
IFS=$SAVEIFS
# TODO delete copleted seeding files
