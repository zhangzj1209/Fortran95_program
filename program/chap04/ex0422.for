	PROGRAM ex0422
	INTEGER A
	REAL    B
      COMPLEX C
	LOGICAL D
	CHARACTER*(20) E
	A=10
	B=12.34
	C=(1,2)
	D=.true.
	E="FORTRAN"
	WRITE(*,100) A ! ��I����ʽ������
	WRITE(*,200) B ! ��F����ʽ��������
	WRITE(*,300) C ! complexҲ�Ǹ�����
	WRITE(*,400) D ! ��L�����logical
	WRITE(*,500) E ! ��A������ַ���
100	FORMAT(1X,I5)
200	FORMAT(1X,F5.2)
300	FORMAT(1X,F4.1,F4.1)
400	FORMAT(1X,L3)
500	FORMAT(1X,A10)
	END
