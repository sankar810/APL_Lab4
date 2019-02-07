        program stats
	integer nmax,n,minno,maxno,rangeno
	real median,avg,sumno,variance,sd
        parameter (nmax=50)
        real x(nmax)
        call READAR(x, n)
	call WRITAR(x, n)
	call SHELL(x, n)
	write(*,*)'The sorted array'
	do 1 i=1,1
    		write(*,2) (x(j),j=1,n)
 1	continue
 2      format(' ',6F8)
	sumno   = 0.0 
        do 4, i = 1,n 
	        sumno   = sumno   + x(i) 
		minno=x(1)
		maxno=x(n)
 4      continue 
	rangeno=abs(maxno-minno)
        avg = sumno / n
	sumsq = 0.0
        do 7, i = 1,n
           sumsq = sumsq + (x(i) - avg)**2
 7      continue
        sd  = sqrt(sumsq /(n-1))
	variance=sumsq/n
	if (mod(n,2) == 0) then           
        	median = (x(n/2) + x(n/2+1)) / 2
      	else
         	median = x(n/2+1)
      	end if
	write(*,*)'Mean of the elements'
	write(*,*)avg
	write(*,*)'Median of the elements'
	write(*,*)median
	write(*,*)'Minimum of the elements'
	write(*,*)minno
	write(*,*)'Maximum of the elements'
	write(*,*)maxno
	write(*,*)'Range of the elements'
	write(*,*)rangeno
	write(*,*)'Standard deviation of the elements'
	write(*,*)sd
	write(*,*)'Variance of the elements'
	write(*,*)variance
        end 
 	subroutine READAR (x, n)
	character FNAME*128
	integer nmax,n
        parameter (nmax=50)
        real x(nmax)	
        write(*,*)'Enter the input file name'
        read *, FNAME 
        open(5,file=FNAME ,status='OLD')
	do 10 i= 1, nmax
        	read(5,*,end=15) x(i)
		n=i	
 10 	continue
 15	write(*,*)'Number of elements in file'
	write(*,*)n
        close (5)
	return
	end
	subroutine WRITAR (x, n)
	integer nmax,n
        parameter (nmax=50)
        real x(nmax)
	write(*,*)'elements of file'
	do 21 i=1,1
    		write(*,35) (x(j),j=1,n)
 21	continue
 35     format(' ',6F8)
	return
	end
	subroutine SHELL (x, n)
	integer n, temp, k, l
	real x(n)
	do 25 k = 1, n-1
		do 22 l = k+1, n
			if(x(k).gt.x(l)) then
				temp = x(k)
				x(k) = x(l)
				x(l) = temp
			endif
 22 		continue
 25 	continue
	return
	end
