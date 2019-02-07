1      program pgm1
2      WRITE(*,*)'Enter the input file name'
3      READ(*,'(A)',END=5)FNAME
4      OPEN(1,FILE=FNAME,STATUS='OLD',BLANK='ZERO',ERR=3)
5      end 
