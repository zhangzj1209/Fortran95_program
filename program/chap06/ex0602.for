	PROGRAM ex0602
	IMPLICIT NONE
	INTEGER limit
	PARAMETER(limit=10)
	INTEGER counter
	INTEGER ans
	DATA ans /0/

	DO 100, counter=2, limit, 2
100	  ans = ans + counter
      
	WRITE(*,*) ans

	STOP
	END