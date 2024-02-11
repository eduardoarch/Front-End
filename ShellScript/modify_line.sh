#!/bin/bash

file_path="/home/eduardo/Downloads/Teste.txt"
line_to_modify="I'm Eduardo and I'm studying Shellscript"

# Check if the file exists
if [ -f "$file_path" ]; then
    # Modify the line in the file
    sed -i "s/$line_to_modify/$line_to_modify nowatchdog/g" "$file_path"
else
    # Create the file with the modified line
    echo "$line_to_modify nowatchdog" > "$file_path"
fi
