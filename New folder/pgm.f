1      PROGRAM pgm
2      CHARACTER F*128
3      REAL X(500),I
4      WRITE(*,*)'Enter the input file name'
5      READ *, F 
6      OPEN(1,FILE=F,STATUS='OLD',BLANK='NULL',ERR=4)
7      READ(1,*,END=11),num
8      WRITE(6,*) num, ' The array elements'
9      IF(num .GT. 500) STOP 'More number of array elements' 
10     READ(1, *), (X(I), I = 1,num)
11     END 
