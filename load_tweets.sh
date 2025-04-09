#!/bin/sh

# list all of the files that will be loaded into the database
# for the first part of this assignment, we will only load a small test zip file with ~10000 tweets
# but we will write are code so that we can easily load an arbitrary number of files
files='
test-data.zip
'

 echo 'load normalized'
 for file in $files; do
    python3 load_tweets.py --db postgresql://postgres:pass@localhost:10652/postgres --inputs "$file" --print_every 10000

    # call the load_tweets.py file to load data into pg_normalized
 done

# echo 'load denormalized'
# for file in $files; do
   #  unzip -p "$file" | sed 's/\\u0000//g' | psql postgres://postgres:pass@localhost:10651/postgres -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
    # use SQL's COPY command to load data into pg_denormalized
# done

# Notes
# - Looping over $files, which only has a single file
# In next assignment, will be adding multiple files so should modify $files
# - By using a denormalized representation, we have no guarantees on data integrity
# Very easy to add same tweet twice into database
# After adding denormalized data, comment it out so it doesn't add twice
