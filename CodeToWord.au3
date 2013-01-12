#include <Array.au3>

;~ press CTRL + C
Send("^c")
$snippedLines = StringSplit(ClipGet(),@CRLF,1)

;~ Removes first line because it contains
;~ the count of all lines stored in the string
_ArrayReverse($snippedLines)
_ArrayPop($snippedLines)
_ArrayReverse($snippedLines)

$i = 1
$result = ""

$lineCountFirst = 0
$lineCountSecond = 1
$lineDelimiter = ' '

;~ iterating through array of code lines
FOR $codeLine in $snippedLines 
;~ increase the line numbers
	If Int($lineCountSecond) > 9 Then
		$lineCountSecond = 0
		$lineCountFirst += 1
	EndIf
	
;~ creates the line number
	$lineMark = String($lineCountFirst) & String($lineCountSecond) & $lineDelimiter
	
;~ concates the line counters with the content of the line	
	$result &= $lineMark & $codeLine & @CRLF
	
	$lineCountSecond += 1
NEXT

;~ stores the numbered code snipped to the
;~ clipboard
ClipPut($result)
