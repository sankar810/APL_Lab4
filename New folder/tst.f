1	program tst
2       CHARACTER FNAME*50 
3       REAL X(1000) 
4       WRITE(UNIT=*, FMT=*) 'Enter data file name:' 
5       READ(UNIT=*, FMT='(A)') FNAME 
6       OPEN(UNIT=1, FILE=FNAME, STATUS='OLD') 
c*Read number of data points NPTS 
7       READ(UNIT=1, FMT=*) NPTS 
8       WRITE(UNIT=*, FMT=*) NPTS, ' data points' 
9       IF(NPTS .GT. 1000) STOP 'Too many data points' 
10       READ(UNIT=1, FMT=*) (X(I), I = 1,NPTS) 
11      CALL MEANSD(X, NPTS, AVG, SD) 
12       WRITE(UNIT=*, FMT=*) 'Mean =', AVG, ' Std Deviation =', SD 
13       END 

14       SUBROUTINE MEANSD(X, NPTS, AVG, SD) 
15       INTEGER NPTS 
16       REAL X(NPTS), AVG, SD 
17       SUM   = 0.0 
18       DO 20, I = 1,NPTS 
19           SUM   = SUM   + X(I) 
20     CONTINUE 
21       AVG = SUM / NPTS 
22       SUMSQ = 0.0
23       DO 25, I = 1,NPTS
24           SUMSQ = SUMSQ + (X(I) - AVG)**2
25     CONTINUE
26       SD  = SQRT(SUMSQ /(NPTS-1)) 
27       END 
