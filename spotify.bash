
# makes a data field
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata >>/home/mononoke/spotify-saver/spotify_music.txt

# extracts the data
# makes the array of targets in which we have the info stored.. 
IFS_backup=$IFS
IFS=$'\n'
targets=($(grep -o '".*"' spotify_music.txt | sed 's/"//g')) # grep then replace every " with NULL
IFS=$IFS_backup

# clear the file contents for next time use
# send the specified fields to array .txt as csv values
a=${targets[14]} # song name
b=${targets[10]} # artist name
c=${targets[17]} # song url
final="${a},${b},${c}"
# echo $final >> /home/mononoke/music/spotify_music.csv
echo $final >> /home/mononoke/spotify-saver/spotify_music.csv
> spotify_music.txt