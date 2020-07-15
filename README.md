# Auto Attachment Printer

Easy to use & simple script to automatically print **PDF** attachments from a mailbox.

## Getting Started

This script is made for Linux. It should be quite easy to change this code for Windows & Mac.
We run this on multiple locations using Raspberry Pi Zero W 512MB, 16GB Sandisk Class10 SD-card.
Distro used: DietPi (Raspbian can also be used)

### Prerequisites

```
apt-get install procmail git fetchmail uudeview cups
```

### Installing

```
git clone https://github.com/amerkestijn/auto-attachment-printer.git
```
When done, cd into project and edit the following files and enter your information (what to edit is marked in the files)
```
nano fetchmail.conf
nano printmail.sh
```
It may be necessary to modify permissions. More info: https://www.linux.com/training-tutorials/understanding-linux-file-permissions/

### Run Script

```
bash ./printmail.sh
```

### Create cronjob

```
crontab -e -u YOUR-USERNAME
```

```
#At the end of this file add the following with the path to the script
* * * * * /path/to/script/dir.sh
```
```
#Exit out of crontab and restart cron
sudo service cron restart

#As i was using dietpi we need to enable cron.minutely
sudo dietpi-cron

#For the use of cron, give extended rights/chmod to the file: printmail.sh | Otherwise the cronjob cannot execute.
```

## Deployment

Deploy this at your own risk.

## Authors & Credits

* **Thomas Hampel** - *Initial creator* - (https://github.com/thampel)
* **Aron Merkestijn** - *Small edits & corrections* - (https://github.com/amerkestijn)

If you have any questions regarding this script please contact me (https://github.com/amerkestijn), or create an issue.

Mr.Hampel made this tutorial originally in 2015 on his own blog. 

Because of changes over the years some commands & installations have changed, which is why i made this repo to simplify things for myself and others.

You can find his original tutorial here: 
https://blog.thomashampel.com/blog/tomcat2000.nsf/dx/print-email-attachments-with-a-raspberrypi.htm
