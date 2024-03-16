#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Initialize the counter
counter := 1

; Read each line from the input file
Loop, Read, Sc1.fds
{
    line := A_LoopReadLine
    
    ; Check if the line contains the XB parameter
    if (RegExMatch(line, "XB=([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),(.*)", coords))
    {
        ; Extract each coordinate value
        X1 := coords1 / 1000
        X2 := coords2 / 1000
        Y1 := coords3 / 1000
        Y2 := coords4 / 1000
        Z1 := coords5 / 1000
        Z2 := coords6 / 1000
        SURF_ID := coords7
        
        ; Format the coordinates with the desired decimal precision
        formattedCoords := Format("{:0.9f},{:0.9f},{:0.9f},{:0.9f},{:0.3f},{:0.3f}", X1, X2, Y1, Y2, Z1, Z2)
        
        ; Construct the new line with the rearranged coordinates
        newLine := "&OBST ID='OBST" . counter . "', XB=" . formattedCoords . ", SURF_ID='" . SURF_ID . ""
        
        ; Increment the counter
        counter++
        
        ; Write the new line to the output file
        FileAppend, %newLine%`n, output.fds
    }
    else
    {
        ; Write the original line to the output file if it doesn't contain XB parameter
        FileAppend, %line%`n, output.fds
    }
}

