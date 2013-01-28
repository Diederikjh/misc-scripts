#!/bin/bash

DOWNLOAD_COMPLETED_FOLDER=/media/0ac9ae61-c9cc-4151-9888-be26c02af604/space/downloads/_completed/
VIDEO_ROOT=/media/0ac9ae61-c9cc-4151-9888-be26c02af604/videos/

# Some things might still keep file locked, so wait a bit
sleep 3

cd $DOWNLOAD_COMPLETED_FOLDER

declare -a pattern=("New*Girl*" 
	"The*Big*Bang*Theory*"
        "Greys*Anatomy*"
 	"How*I*Met*Your*Mother*"
	"Gossip*Girl*"
	"Rizzoli*and*Isles*"
	"Burn*Notice*"
	"Futurama*"
	"South*Park*"
	"The*Newsroom*"
	"Mad*Men*"
	"Modern*Family*"
	"Downton*Abbey*"
	"Doctor*Who*"
	"The.Daily.Show*"
	"Two*and*a*Half*Men*"
	"White*Collar*"
	"Pretty*Little*Liars*"
	"*Glee*"
)

declare -a dest=("New girl/" 
	"Big bang theory/Season 6/"
        "Greys anatomy/Season 9/"
	"How I met your mother/8/"
	"Gossip Girl/6/"
	"rizzoli & Isles/"
	"Burn Notice/"
	"Futurama/"
	"south park/"
	"The Newsroom/"
	"mad men/"
	"Modern Family/"
	"Downton Abbey/"
	"Dr Who/"
	"the daily show/"
	"Two and a half men/"
	"White collar/Season 4/"
	"Pretty Little Liars/S02/"
	"/Glee/Glee\ Season\ 4/"
)

#WTF BASH!@@??? http://www.cyberciti.biz/tips/handling-filenames-with-spaces-in-bash.html
#Change the argument seperator to arbiray character. (And restor it later)
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
MOVE_OR_COPY_COMMAND=cp
MOVE_OR_COPY_ARGS=-uv
for i in $(seq 0 $((${#pattern[@]} - 1)))
do
   echo ${pattern[i]}
#   echo $MOVE_OR_COPY_COMMAND ${pattern[$i]} \"${VIDEO_ROOT}${dest[$i]}\"
   $MOVE_OR_COPY_COMMAND $MOVE_OR_COPY_ARGS ${pattern[$i]} ${VIDEO_ROOT}${dest[$i]}
done
# restore $IFS
IFS=$SAVEIFS

#mv House* ${VIDEO_ROOT}House/House\ 8/
#mv New.Girl* ${VIDEO_ROOT}New\ girl/
#mv New\ Girl* ${VIDEO_ROOT}New\ girl/
#mv The*Big*Bang*Theory* ${VIDEO_ROOT}Big\ bang\ theory/Season\ 6/
#mv Greys*Anatomy* ${VIDEO_ROOT}Greys\ anatomy/Season\ 9/
#mv How.I.Met.Your.Mother* ${VIDEO_ROOT}How\ I\ met\ your\ mother/8/
#mv How\ I\ Met\ Your\ Mother* ${VIDEO_ROOT}How\ I\ met\ your\ mother/8/
#mv Gossip*Girl* ${VIDEO_ROOT}Gossip\ Girl/6/
#mv Rizzoli*and*Isles* ${VIDEO_ROOT}\rizzoli\ \&\ Isles/
#mv Burn*Notice* ${VIDEO_ROOT}\Burn\ Notice/
#mv Futurama* ${VIDEO_ROOT}\Futurama/
#mv South*Park* ${VIDEO_ROOT}\south\ park/
#mv The*Newsroom* ${VIDEO_ROOT}\The\ Newsroom/
#mv Mad*Men* ${VIDEO_ROOT}\mad\ men/
#mv Modern*Family* ${VIDEO_ROOT}/Modern\ Family/
#mv Downton*Abbey* ${VIDEO_ROOT}/Downton\ Abbey
#mv Doctor*Who* ${VIDEO_ROOT}/Dr\ Who/
#mv The.Daily.Show* ${VIDEO_ROOT}/the\ daily\ show/
#mv Two*and*a*Half*Men* ${VIDEO_ROOT}/Two\ and\ a\ half\ men/
#mv White*Collar* ${VIDEO_ROOT}/White\ collar/Season 4/
#mv Pretty*Little*Liars* ${VIDEO_ROOT}/Pretty\ Little\ Liars/S02/
#mv *Glee* ${VIDEO_ROOT}/Glee/Glee\ Season\ 4/
