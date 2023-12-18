10 REM Todmorden Tetris
20 MODE 2
30 PROCinit
40 REPEAT
50   PROCgenerateBlock
60   REPEAT
70     PROCmoveBlockDown
80     VDU 23
90     WAIT 200
100   UNTIL PROCcheckCollision
110   PROCplaceBlock
120 UNTIL FALSE

130 DEF PROCinit
140   FOR y = 0 TO 24
150     FOR x = 0 TO 39
160       VDU 19, 0
170     NEXT x
180   NEXT y
190 ENDPROC

200 DEF PROCgenerateBlock
210   blockX = 5
220   blockY = 0
230   blockColor = INT(RND * 3) + 1
240   blockShape = INT(RND * 2) + 1
250   PROCdrawBlock(blockX, blockY, blockColor, blockShape)
260 ENDPROC

270 DEF PROCdrawBlock(x, y, color, shape)
280   REM Define block shapes
290   IF shape = 1 THEN
300     VDU 19, color
310     VDU 24, x * 20, y * 10
320     VDU 24, x * 20 + 19, y * 10 + 9
330   ELSE
340     VDU 19, color
350     VDU 24, x * 20, y * 10
360     VDU 24, x * 20 + 19, y * 10
370   ENDIF
380 ENDPROC

390 DEF PROCmoveBlockDown
400   PROCeraseBlock(blockX, blockY, blockShape)
410   blockY = blockY + 1
420   PROCdrawBlock(blockX, blockY, blockColor, blockShape)
430 ENDPROC

440 DEF PROCeraseBlock(x, y, shape)
450   VDU 19, 0
460   IF shape = 1 THEN
470     VDU 24, x * 20, y * 10
480     VDU 24, x * 20 + 19, y * 10 + 9
490   ELSE
500     VDU 24, x * 20, y * 10
510     VDU 24, x * 20 + 19, y * 10
520   ENDIF
530 ENDPROC

540 DEF PROCplaceBlock
550   PROCdrawBlock(blockX, blockY, blockColor, blockShape)
560 ENDPROC

570 DEF PROCcheckCollision
580   REM Check collision with bottom or other blocks
590   IF blockY >= 24 THEN RETURN TRUE
600   REM Add collision check with other blocks if placed
610   RETURN FALSE
620 ENDPROC
