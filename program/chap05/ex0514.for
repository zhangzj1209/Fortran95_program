	PROGRAM ex0514
	IMPLICIT NONE
	REAL height ! ��¼���
	REAL weight ! ��¼����

	WRITE(*,*) "height:"
	READ(*,*)   height     ! �������
	WRITE(*,*) "weight:"
	READ(*,*)   weight     ! ��������
	
	IF ( weight > height-100 ) GOTO 200
	! ���治����, û������200�Ż�ִ������
100	WRITE(*,*) "Under control." 
	GOTO 300  ! ��һ�в���ִ������Ҫ����300.
200   WRITE(*,*) "Too fat!"
	
300	STOP
	END