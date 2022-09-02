LINK="$1"
ALL_FORMATS="$(yt-dlp "$LINK" -F | grep "B*https")"
VIDEO_FORMAT="$(printf "$ALL_FORMATS" | fzf | awk '{print $1}')"
AUDIO_FORMAT="$(printf "$ALL_FORMATS" | fzf | awk '{print $1}')"
title=$(youtube-dl -f mp4 -o '%(id)s.%(ext)s' --print-json --no-warnings "$LINK" | jq -r .title)
printf "$title\n"
yt-dlp "$LINK" -f "$VIDEO_FORMAT" -o TEMPORARY-OUTPUT-VIDEO-THAT-WILL-BE-DELETED-LATER-ON
yt-dlp "$LINK" -f "$AUDIO_FORMAT" -o TEMPORARY-OUTPUT-AUDIO-THAT-WILL-BE-DELETED-LATER-ON
ffmpeg -i "TEMPORARY-OUTPUT-VIDEO-THAT-WILL-BE-DELETED-LATER-ON" -i "TEMPORARY-OUTPUT-AUDIO-THAT-WILL-BE-DELETED-LATER-ON" -c copy "$title.mkv"
rm TEMPORARY-OUTPUT-VIDEO-THAT-WILL-BE-DELETED-LATER-ON
rm TEMPORARY-OUTPUT-AUDIO-THAT-WILL-BE-DELETED-LATER-ON
