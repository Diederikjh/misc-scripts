#!/bin/bash

kids_filter="n == /Sofia the First/ || n == /Paw Patrol/ || n == /Doc McStuffins/"
series_filter="{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}{'.'+lang}"
random_folder="/media/drbergie/92ca4fa9-cae3-48f3-a87a-62e76347b16c"

input_path=$2

if [ "$1" = "DC" ]; then
    ACTION=move
else
    ACTION=copy
    input_path=$1
fi

#Once off move exisitng Kids files
#filebot -script fn:amc --output "/media/drbergie/92ca4fa9-cae3-48f3-a87a-62e76347b16c" --log-file ~/temp/filebot.log --action move -non-strict --def unsorted=n seriesFormat="/home/drbergie/Videos/Emma/Emma series/{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}{'.'+lang}" --filter "n == /Sofia the First/ || n == /Paw Patrol/ || n == /Doc McStuffins/" '/home/drbergie/Videos/Emma/Emma series/sofia the first'

#Kids series
filebot -script fn:amc --output $random_folder --log-file ~/temp/filebot.log --action $ACTION -non-strict --def unsorted=n seriesFormat="/home/drbergie/Videos/Emma/Emma series/$series_filter" --filter "$kids_filter" "$input_path"

#Movies & Series
filebot -script fn:amc --output $random_folder --log-file ~/temp/filebot.log --action $ACTION -non-strict --def unsorted=n seriesFormat="/home/drbergie/Videos/Series/$series_filter" movieFormat="/media/drbergie/92ca4fa9-cae3-48f3-a87a-62e76347b16c/Movies/{ny}/{fn}" --filter "!($kids_filter)" "$input_path"

