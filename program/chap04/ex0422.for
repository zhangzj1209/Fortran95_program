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
	WRITE(*,100) A ! 用I来格式化整数
	WRITE(*,200) B ! 用F来格式化浮点数
	WRITE(*,300) C ! complex也是浮点数
	WRITE(*,400) D ! 用L来输出logical
	WRITE(*,500) E ! 用A来输出字符串
100	FORMAT(1X,I5)
200	FORMAT(1X,F5.2)
300	FORMAT(1X,F4.1,F4.1)
400	FORMAT(1X,L3)
500	FORMAT(1X,A10)
	END
