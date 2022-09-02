qrencode "$(xclip -selection clipboard -o)" -o temp-qr-code.png
sxiv temp-qr-code.png
#rm temp-qr-code.png
