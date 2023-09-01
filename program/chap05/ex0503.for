	PROGRAM ex0503
	IMPLICIT NONE
	INTEGER rain, windspeed

	WRITE(*,*) "Rain:"
	READ (*,*) rain
	WRITE(*,*) "Wind Speed:"
	READ (*,*) windspeed

	IF ( rain .GT. 150 .OR. windspeed .GT. 10 ) THEN
	  WRITE(*,*) "不用上班上课"
	ELSE
	  WRITE(*,*) "照常上班上课"
	END IF

	STOP
	END