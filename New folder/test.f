1	program test 
2	CHARACTER FNAME*50 
3	REAL X(1000) 
4	WRITE(UNIT=*, FMT=*) 'Enter data file name:' 
5	READ(UNIT=*, FMT='(A)') FNAME 
6	OPEN(UNIT=1, FILE=FNAME, STATUS='OLD') 
c7*Read number of data points NPTS 
7	READ(UNIT=1, FMT=*) NPTS 
8	WRITE(UNIT=*, FMT=*) NPTS, ' data points' 
9	IF(NPTS .GT. 1000) STOP 'Too many data points' 
10	READ(UNIT=1, FMT=*) (X(I), I = 1,NPTS) 
11	WRITE(UNIT=*, FMT=*) (X(I), I = 1,NPTS)
12	end 
