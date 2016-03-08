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
- Backup a specific directory
```
./backup.sh $directory_to_backup
```

##Restore Tool:

- Run:
```
./restore.sh $backup_file $target_directory
```


