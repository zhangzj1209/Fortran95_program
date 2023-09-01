      PROGRAM  ex0516
      IMPLICIT NONE

      INTEGER  I
      INTEGER  N
      DATA I,N /2,1/
	
	GOTO(10,20,30) I/N
10    WRITE(*,*) 'I/N=1'
	GOTO 100
20	WRITE(*,*) 'I/N=2'
	GOTO 100
30	WRITE(*,*) 'I/N=3'

100	STOP
      END
