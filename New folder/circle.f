      program circle 
      real r, area, pi 
c This program reads a real number r and prints 
c the area of a circle with radius r. 
      write (*,*) 'Give radius r:' 
      read  (*,*) r 
      pi = atan(1.0e0)*4.0e0 
      area = pi*r*r 
      write (*,*) 'Area = ', area 
      end 
