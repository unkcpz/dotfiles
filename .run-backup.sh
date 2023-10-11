#!/usr/bin/env bash

# These variables should be adjusted after copying the script!!!!!
INCLUDES=("$HOME/Projects")
EXCLUDES=("**/*.pyc" "**/.tox/*")
#DRY_RUN="--dry-run"


# These variables depend on the backup policies+server location and might
# have to be adjusted if something like the server address changes.
MAX_CHAIN_AGE="90D"
MAX_AGE="1Y"

# Do not touch unless you know what you are doing
LOG_LVL="8" # 4=Default 8=INFO 9=DEBUG (avoid 9 if not necessary can produce GBs of logs)
VOL_SIZE="25" # 25MB. Same default used by deja-dup for compatibility
BASE_DIR="/"
DEST="/nfs/wsbackup/backups"
CACHE_DIR="$HOME/.cache/deja-dup"
TMP_DIR="$CACHE_DIR/tmp"
ARC_DIR="$CACHE_DIR"
mkdir -p "$HOME/.local"
LOG="$HOME/.local/duplicity.log"
echo "" > $LOG
echo "--------------------------------------------------------------------------------" >> $LOG
mkdir -p $TMP_DIR/tmp
echo `date` >> $LOG
OPT="--include=$CACHE_DIR/metadata "
OPT+="--exclude=$CACHE_DIR "

for d in "${EXCLUDES[@]}"; do
 OPT+="--exclude=$d "
done

for d in "${INCLUDES[@]}"; do
 OPT+="--include=$d "
done

OPT+="--exclude=** "

duplicity \
 remove-older-than $MAX_AGE \
 "file://${DEST}" \
 --force \
 --no-encryption --verbosity="$LOG_LVL" \
 --archive-dir="$ARC_DIR" \
 --tempdir="$TMP_DIR" >> $LOG 2>&1

duplicity \
 ${OPT} \
 --volsize="$VOL_SIZE" "$BASE_DIR" "file://${DEST}" \
 ${DRY_RUN} \
 --no-encryption --verbosity="$LOG_LVL" \
 --archive-dir="$ARC_DIR" \
 --full-if-older-than="$MAX_CHAIN_AGE" \
 --tempdir="$TMP_DIR" >> $LOG 2>&1

