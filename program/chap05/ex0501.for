	PROGRAM ex0501
	IMPLICIT NONE
	REAL speed

	WRITE(*,*) "speed:"
	READ (*,*) speed
	
	IF ( speed .GT. 100 ) then ! FORTRAN 77Ҫ����д.GT.�������">"
	  write(*,*) "Slow down."
	END IF

	STOP
	END