# Auto Attachment Printer

Easy to use & Simple script for automatically printing PDF attachments from an mailbox.

## Getting Started

This script is made for Linux. It should be quite easy to change this code for Windows & Mac.
We run this on multiple locations using Raspberry Pi Zero W 512MB, 16GB Sandisk Class10 SD-card.
Distro used: DietPi (Raspbian can also be used)

### Prerequisites

```
apt-get install procmail fetchmail uudeview cups
```

### Installing

```
git clone https://github.com/amerkestijn/auto-attachment-printer.git
```
When done, cd into project and edit the following files and enter your information (what to edit is marked in the files)
```
nano fetchmail.conf
nano procmail.conf
nano printmail.sh
```

### Run Script

```
bash ./printmail.sh
```

### Create cronjob

```
crontab -e -u USERNAME
```

```
#At the end of this file add the following with the path to the script
* * * * * /path/to/script/dir.sh
```
```
#Exit out of crontab and restart cron
sudo service cron restart
```

## Deployment

Deploy this at your own risk.
We use it locally. No connection from outside our own network.

## Authors & Credits

* **Thomas Hampel** - *Initial creator* - (https://github.com/thampel)
* **Aron Merkestijn** - *Small edits & corrections* - (https://github.com/amerkestijn)

If you have any questions regarding this script please contact me (https://github.com/amerkestijn), or create an issue.
Mr.Hampel made this tutorial originally in 2015 on his own blog. 
Because of changes over the years some commands & installations have changed, which is why i made this repo to simplify things for myself and others.
You can find his original tutorial here: https://blog.thomashampel.com/blog/tomcat2000.nsf/dx/print-email-attachments-with-a-raspberrypi.htm
