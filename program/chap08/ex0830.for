	PROGRAM  ex0830
	IMPLICIT NONE
	INTEGER  N
	INTEGER  fact

	WRITE(*,*) 'N='
	READ (*,*) n
	WRITE(*, "(I2,'! = ',I8)" ) n, fact(n)
	
	STOP
	END

	INTEGER FUNCTION ifact(n)
	IMPLICIT NONE
	INTEGER fact
	INTEGER n
	
	ifact = fact(n)
	
	RETURN
	END

	INTEGER FUNCTION fact(n)
	IMPLICIT NONE
	INTEGER  n
	INTEGER  count
	INTEGER  localcount, temp  ! �ֲ�����
	INTEGER  ifact
	EXTERNAL ifact
	SAVE     count
	data     count  /1/

	localcount = count
	count = count+1
	WRITE(6, 100) localcount, n
100   FORMAT(I2,'th enter, n=',I2)
	IF ( n < 0 ) THEN ! �����������
	  fact = -1       ! ����趨һ��ֵ
	  WRITE(6, 200) localcount, n, fact
	  RETURN          ! n������, ֱ��return 
	ELSE IF ( n <= 1 ) THEN
        fact = 1          
        WRITE(6, 200) localcount, n, fact
        RETURN          ! ���������µݹ���, return 
      END IF
      ! ��ִ�е���, ����n>1, ��n*(n-1)!������n!
      temp = n-1
      fact = n * ifact(temp) ! ����ifact, ifact��ֱ���ٵ���fact
      WRITE(6, 200) localcount, n, fact
200   FORMAT(I2,'th exit, n=',I2, ' ans=',I8)
      RETURN
	END
