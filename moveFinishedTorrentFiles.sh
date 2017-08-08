#!/bin/bash

DOWNLOAD_COMPLETED_FOLDER=/home/drbergie/Downloads/
VIDEO_ROOT=/home/drbergie/Videos/Series/


if [ "$1" = "DC" ]; then
	cd $DOWNLOAD_COMPLETED_FOLDER/DC_complete/
        MOVE_OR_COPY_ARGS=-uv
        MOVE_OR_COPY_ARGS_DIR=-uv
	MOVE_OR_COPY_COMMAND=mv
else
	cd $DOWNLOAD_COMPLETED_FOLDER/torrents_complete/
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
        "*Chicago*P.D*"
        "*Chicago*Fire*"
        "*Knick*"
        "*Reign*"
        "[Gg]ame*of*[Tt]hrones*"
	"Mr*Robot*"
        "[bB]rooklyn*[nN]ine*[nN]ine*"
        "The*Astronaut*Wives*Club*"
    "Code[. ]Black*"
    "Silicon*Valley*"
    "New Girl*"
    "[Tt]he.[Gg]rand.[Tt]our*"
    "[Tt]op[. ][Gg]ear*"
    "Westworld*"
    "The.Night.Shift*"
    "The*Grand*Tour*"
)

declare -a dest=("New girl/" 
	"Big bang theory/"
    "Greys anatomy/"
	"Rizzoli and Isles/"
	"south park/"
	"Modern family/"
	"the daily show/"
    "qi/"
	"The Walking dead/"
        "chicago Fire/"
        "chicago med/"
        "Chicago PD/"
        "Chicago PD/"
        "chicago fire/"
        "The Knick/"
        "reign/"
        "game of thrones/"
	"mr robot/"
        "Brooklyn nine nine/"
        "The Astronaut Wives Club/"
    "Code Black/"
    "Silicon Valley/"
    "New girl/"
    "the grand tour/"
    "top gear/"
    "Westworld/"
    "night shift/"
    "The Grand Tour/"
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
