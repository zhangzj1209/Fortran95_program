	PROGRAM ex0514
	IMPLICIT NONE
	REAL height ! 记录身高
	REAL weight ! 记录体重

	WRITE(*,*) "height:"
	READ(*,*)   height     ! 读入身高
	WRITE(*,*) "weight:"
	READ(*,*)   weight     ! 读入体重
	
	IF ( weight > height-100 ) GOTO 200
	! 上面不成立, 没有跳到200才会执行这里
100	WRITE(*,*) "Under control." 
	GOTO 300  ! 下一行不能执行所以要跳到300.
200   WRITE(*,*) "Too fat!"
	
300	STOP
	END