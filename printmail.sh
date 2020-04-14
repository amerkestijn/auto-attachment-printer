#!/bin/bash
# Parameters
BASEDIR=$(dirname $0)
CURDIR=$(pwd)
HOMEDIR=/path/to/project/dir
MAILDIR=/path/to/project/dir/maildata
LOGFILE=/path/to/project/dir/logs/printmail.log
ATTACH_DIR=/path/to/project/dir/attachments
DATE=`date "+%Y%m%d-%H%M%S"`
# change directory
echo $DATE "Switching directory to : $BASEDIR"
cd $BASEDIR
# create log file if it does not exist
touch $LOGFILE
date +%r-%-d/%-m/%-y >> $LOGFILE
# fetch mail
echo $DATE "Checking for new mail..."
fetchmail -f $HOMEDIR/fetchmail.conf -L $LOGFILE
# process new mails
shopt -s nullglob
for i in $MAILDIR/new/*
do
  echo $DATE "Processing : $i" | tee -a $LOGFILE
  uudeview $i -i -p $ATTACH_DIR/
# process file attachments with space (thanks to Dr.B.)
   cd $ATTACH_DIR
   for e in ./*
       do
           mv "$e" "${e// /_}"
   done
   for f in *.PDF
       do
       mv $f ${f%.*}.pdf
   done
   cd $BASEDIR
# end of Dr.B. patch
  echo $DATE "Printing PDFs" | tee -a $LOGFILE
  for x in $ATTACH_DIR/*.pdf
  do
          echo $DATE "Printing : $x" | tee -a $LOGFILE
          lp $x | tee -a $LOGFILE
          echo $DATE "Deleting file : $x" | tee -a $LOGFILE
          rm $x | tee -a $LOGFILE
  done
  echo $DATE "Clean up and remove any other attachments"
  for y in $ATTACH_DIR/*
  do
          rm $y
  done
  # delete mail
  echo $DATE "Deleting mail : $i" | tee -a $LOGFILE
  rm $i | tee -a $LOGFILE
done
shopt -u nullglob
echo $DATE "Job finished at:" $DATE | tee -a $LOGFILE
cd $CURDIR
