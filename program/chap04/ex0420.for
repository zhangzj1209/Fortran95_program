      PROGRAM ex0420
	INTEGER A
	A=100
	WRITE(*,100) A ! 使用行代码100地方设定的格式来输出变数a
100	FORMAT(I4)     ! 最前面的100是行代码, 把这一行程序代码给一个编号
      END
