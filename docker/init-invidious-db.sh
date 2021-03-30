#!/bin/bash
set -eou pipefail



## If you want to create more than one database, please use that variable
## Variable example: POSTGRES_DATABASES="database1:user1|database2:user2|database3:user3"
#if [ "$POSTGRES_DATABASES" ]; then
#	DATABASES_ARR=$(echo $POSTGRES_DATABASES | tr "|" "\n")
#	for DATABASE in $DATABASES_ARR
#	do
#		DATABASE_NAME=`echo $DATABASE | cut -d: -f1`
#		DATABASE_OWNER=`echo $DATABASE | cut -d: -f2`
#		if [ "$DATABASE_NAME" = 'invidious' ]; then
#			if [ "$DATABASE_OWNER" ]; then
#				POSTGRES_USER=`echo $DATABASE_OWNER`
#				POSTGRES_DB=`echo $DATABASE_NAME`
#				echo
#			else
#				echo
#			fi
#		fi
#	done
#fi



psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER postgres;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/channels.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/videos.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/channel_videos.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/users.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/session_ids.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/nonces.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/annotations.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/playlists.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < config/sql/playlist_videos.sql
