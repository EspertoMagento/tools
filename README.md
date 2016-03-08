#Bash script tools

#Description

##Backup & Restore Tools:
This script allows you to backup a particular directory and databases into compressed file. It also allows you to restore directories and databases from a backup file.

##Backup Tool:
This script allows you to backup directory and database.

##1- Installation
- Copy the .sh file where you want or run ```git clone https://github.com/danycrup85/tools.git```
 
##2- Usage

- Run:
```
./backup.sh
```
- Run automatic (ex in cron):
```
./backup.sh $directory_to_backup $target_directory
```

##Restore Tool:

- Run:
```
./restore.sh
```
- Run automatic (ex in cron):
```
./restore.sh $backup_file $target_directory
```

##3- Optional: Execute script wherever you want
Copy files to /usr/local/bin and give 755 permission to use script wherever you want.

