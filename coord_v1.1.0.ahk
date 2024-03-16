#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

;Gui +AlwaysOnTop ;Поверх всех окон
Gui Add, Edit, x20 y20 w300 h25 vInputFile, Select .fds file
Gui Add, Button, x330 y20 w80 h25 gChooseFile, Browse
Gui Add, Button, x20 y60 w100 h30 gProcessFile, Process
Gui Add, Button, x130 y60 w100 h30 gExit, Exit
Gui Show, w450 h120, WizFDS Divider
return

ChooseFile:
    FileSelectFile, inputFile, 3, , Select .fds file, FDS files (*.fds)
    if (inputFile != "")
        GuiControl, , InputFile, % inputFile
return

ProcessFile:
    GuiControlGet, inputFile, , InputFile
    if (FileExist(inputFile))
    {
        ; Extract the filename and extension
        splitPath := StrSplit(inputFile, "\")
        fileName := splitPath[splitPath.MaxIndex()]
        splitName := StrSplit(fileName, ".")
        fileName := splitName[1]
        fileExt := splitName[2]

        ; Construct the output file name
        outputFile := fileName "_output." fileExt

        ; Initialize the counter
        counter := 1

        ; Read each line from the input file
        Loop, Read, %inputFile%
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
                FileAppend, %newLine%`n, %outputFile%
            }
            else
            {
                ; Write the original line to the output file if it doesn't contain XB parameter
                FileAppend, %line%`n, %outputFile%
            }
        }

        MsgBox, , WizFDS Divider, Processing complete. Output file: %outputFile%
    }
    else
    {
        MsgBox, , WizFDS Divider, The selected file does not exist.
    }
return

Exit:
    ExitApp
return

GuiClose:
    ExitApp
return
