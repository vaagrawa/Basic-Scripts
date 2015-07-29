#!/bin/bash
for f in ./ftp.ncdc.noaa.gov/pub/data/gsod/*
do
tar -xf $f/*.tar -C $f 
gunzip -c $f/*.gz | awk '{if (NR!=1) {print}}' >> ./Ncdc_1929_2014.op
done

for (( year=1929; year<=2014; year++ ))
do
   wget -r –q ftp://ftp.ncdc.noaa.gov/pub/data/gsod/$year/*.tar -o ./ftp.log
done
