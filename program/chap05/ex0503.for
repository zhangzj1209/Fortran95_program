	PROGRAM ex0503
	IMPLICIT NONE
	INTEGER rain, windspeed

	WRITE(*,*) "Rain:"
	READ (*,*) rain
	WRITE(*,*) "Wind Speed:"
	READ (*,*) windspeed

	IF ( rain .GT. 150 .OR. windspeed .GT. 10 ) THEN
	  WRITE(*,*) "�����ϰ��Ͽ�"
	ELSE
	  WRITE(*,*) "�ճ��ϰ��Ͽ�"
	END IF

	STOP
	END