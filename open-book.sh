#FILE="$(find /home/abdulwahab/vault/books/ -name "*.pdf" | grep pdf | fzf)"
FILE="$(find /home/abdulwahab/vault/ -name "*.pdf" | grep pdf | fzf)"
[ "$FILE" = "" ] || swallow zathura "$FILE"
