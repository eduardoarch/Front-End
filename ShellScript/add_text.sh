#!/bin/bash
#
#Create a shellscript to add "I'm Eduardo and I'm studying Shellscript" to the /home/eduardo/Download/Teste.txt#file if the file exists, if it doesn't exist, create the respective file, adding the respective text.

file_path="/home/eduardo/Downloads/Teste.txt"
text="I'm Eduardo and I'm studying Shellscript"

# Check if the file exists
if [ -f "$file_path" ]; then
    # Append the text to the existing file
    echo "$text" >> "$file_path"
else
    # Create the file with the text
    echo "$text" > "$file_path"
fi
