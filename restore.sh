#!/bin/bash
ARGF=$1
ARGDB=$2
NOW=$(date +"%Y-%m-%d-%H%M")

clear
echo -e "\n********* RESTORE TOOL BY DANIELE CRUPI *********\n"
		
		#se è automatizzato in cron
		if [ $ARGDB ]; then
		
			while true
			do
				case $ARGDB in
				0)
				break
				;;
				*)
				echo -e "\n"
				echo $ARGF
				echo -e "sto eseguendo il ripristino del database..........."
				mysql -uroot -proot -h localhost $ARGDB | gzip -9c < $ARGF
				echo -e "fatto\n"
				break
				;;
				esac
			done
		else
		
			#backup db
			echo -n "Vuoi fare il ripristino del database? [Y/n]"
			read bkdb || exit 1
		  	case "$bkdb" in
		  	[Nn]*) bkdb=n with=out;;
		  	*)     bkdb=y with=;;
		  	esac

			if [ 'y' = $bkdb ]; then

			echo -e "Mi servono gli accessi al database\n"
			echo -n "Inserisci il nome del server host [ENTER]: "
			read HOST
			echo -n "Inserisci lo username [ENTER]: "
			read DBUSER
			echo -n "Inserisci la password [ENTER]: "
			read DBPSW
			echo -n "Inserisci il nome del database [ENTER] (Y - view list): "
			read DBNAME || exit 1
		  	case "$DBNAME" in
		  	[Nn]*) DBNAME =n with=out;;
		  	*)     DBNAME =y with=;;
		  	esac

			if [ 'y' = $DBNAME ]; then
				echo "SHOW DATABASES;" | mysql -u$DBUSER -p$DBPSW -h $HOST
				echo -n "Inserisci il nome del database [ENTER]: "
				read DBNAME
				echo -e "\n"

			echo $ARGF

			echo -e "sto eseguendo il ripristino del database..........."
			mysql -u$DBUSER -p$DBPSW -h $HOST $DBNAME | gzip -9c < $ARGF
			echo -e "fatto\n"

			else
	
			echo -e "\n"
			echo $ARGF

			echo -e "sto eseguendo il ripristino del database..........."
			mysql -u$DBUSER -p$DBPSW -h $HOST $DBNAME | gzip -9c < $ARGF
			echo -e "fatto\n"
			fi
		fi
	
	fi	


#se è automatizzato in cron
if [ $ARGDB ]; then

		if [ -d "$ARGDB" ]; then
			ARGDB="${ARGDB////}"

			echo "estraggo '$ARGF' in '$ARGDB'"
			echo -n "sto eseguendo il ripristino dei files..........."
			tar -xvf $ARGF -C $ARGDB
			echo -e "fatto\n"
		else
			echo -e "cartella '$ARGDB' non esistente!\n"
		fi
	
	
else
	
	#backup files	
	echo -n "Vuoi fare il backup dei files? [Y/n]"
	read bkfiles || exit 1
  	case "$bkfiles" in
  	[Nn]*) bkfiles=n with=out;;
  	*)     bkfiles=y with=;;
  	esac

	if [ 'y' = $bkfiles ]; then
	
		echo -n "Inserisci il nome della cartella di cui vuoi fare il ripristino: [ENTER] (Y - view list): "
			read directory || exit 1
		  	case "$directory" in
		  	[Nn]*) directory =n with=out;;
		  	*)     directory =y with=;;
		  	esac

			if [ 'y' = $directory ]; then
				echo | ls
				echo -n "Inserisci il nome della cartella di cui vuoi fare il ripristino: [ENTER]: "
				read directory
				echo -e "\n"
			directory="${directory////}"

		if [ -d "$directory" ]; then
	
			echo "estraggo '$ARGF' in '$directory'"
			echo -n "sto eseguendo il ripristino dei files..........."
			tar -xvf $ARGF -C $directory
			echo -e "fatto\n"
		else
			echo -e "cartella '$directory' non esistente!\n"
		fi


			else
		
		directory="${directory////}"

		if [ -d "$directory" ]; then

			echo "estraggo '$ARGF' in '$directory'"
			echo -n "sto eseguendo il ripristino dei files..........."
			tar -xvf $ARGF -C $directory
			echo -e "fatto\n"
		else
			echo -e "cartella '$directory' non esistente!\n"
		fi
		fi
	fi
fi


echo -e "\n********************* END *************************\n"
