echo off & rem #!/bin/bash

rem #This is a simple script to convert videos (.mp4 or any other format, any framerate, any size) to the format for CPvid. Just fill out these few lines:
rem please install ffmpeg and add it to the PATH, or put these fies into the same folder with ffmpeg.exe

rem # the file you have (can be mp4 or something else, any framerate, size or aspect ratio)
set infile=example.mp4

rem # the name how output folder should be called
set filename=example
rem # the name displayed in CPvid
set vidname=Example Video
rem # the description that CPvid will display
set viddesc=My first YouTube Video. youtu.be/zx6yKF3q4-M

rem rotation
rem set transp=& rem no rotation
set transp=transpose=2,& rem rotate left
rem set transp=transpose=1,& rem rotate right

rem quality
rem set w=106& set h=176& rem low quality
set w=160& set h=264& rem medium quality
rem set w=320& set h=528& rem high quality




rem #########################################################


rem delete old files
del %filename%256
del %filename%.gif


rem convert mp4 to gif (.gif format reduces colors)
ffmpeg.exe -i %infile% -vf %transp%fps=10,scale=w=%w%:h=%h%:force_original_aspect_ratio=decrease %filename%.gif	
rem create output folder
mkdir %filename%256
rem convert .gif to .256 for CPvid
convert.exe -g -i %filename%.gif -o %filename%256/ -n "%vidname%" -d "%viddesc%"


echo ""
echo "Press enter to close."
pause & rem read i
