import math
#import argparse
import sys

video_id, outputFileName = sys.argv[1:3]
# takes in a float called "seconds"
def convertToHMS(seconds):
    intSeconds = int(seconds)
    hours = math.floor(intSeconds/3600) #intSeconds % 3600
    minutes = math.floor(intSeconds/60) - hours*60 #intSeconds % 60
    remainingSeconds = intSeconds - hours*3600 - minutes*60
    milliseconds = math.floor( (seconds - hours*3600 - minutes*60 - remainingSeconds) * 1000 )
    return str(hours).zfill(2) + ":" + str(minutes).zfill(2) + ":" + str(remainingSeconds).zfill(2) + "," + str(milliseconds).zfill(3)


from youtube_transcript_api import YouTubeTranscriptApi as yt
import time
#video_id = "map7yeSJNw0"
#video_id = "4ogntH6_KF4"
#video_id = input("Enter video ID: ")

#outputFileName = "output3.srt"
#outputFileName = input("Enter subtitle file name: ")
transcript = yt.get_transcript(video_id)
captionCount = 1
with open(outputFileName, "w") as subtitleFile:
    for i in range(len(transcript)):
        startTime = convertToHMS( float(transcript[i]["start"]) )
        if i < len(transcript)-1:
            endTime = convertToHMS( float(transcript[i+1]["start"]) )
        else:
            endTime = convertToHMS( float(transcript[i]["start"]) + float(transcript[i]["duration"]) )
        subtitleFile.write(str(captionCount) + "\n")
        subtitleFile.write(startTime + " --> " + endTime + "\n")
        subtitleFile.write(transcript[i]["text"] + "\n\n")
        print(transcript[i])
        captionCount += 1
    '''
    for caption in transcript:
        nextStartTime = 

        startTime = convertToHMS( float(caption["start"]) )
        #endTime = convertToHMS( float(caption["start"]) + float(caption["duration"]) )

        subtitleFile.write(str(captionCount) + "\n")
        subtitleFile.write(startTime + " --> " + endTime + "\n")
        subtitleFile.write(caption["text"] + "\n\n")
        print(caption)
        captionCount += 1

    '''



