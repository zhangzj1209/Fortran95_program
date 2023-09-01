program ex0705
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: matrix(row, col, 3)
  integer m ! 用来指定第几个矩阵
  integer r ! 用来指定row
  integer c ! 用来指定column

  ! 读入矩阵的内容
  do m=1, 2
  write(*,"('Matrix ',I1)") m
    do r=1, row
      do c=1, col
        write(*,"('(',I1,',',I1,')=')") r,c
	    read(*,*) matrix(r,c,m)
	  end do
    end do
  end do

  ! 把第1,2个矩阵相加
  write(*,*) "Matrix 1 + Matrix 2 = "
  do r=1, row
    do c=1, col
	  matrix(r,c,3) = matrix(r,c,1)+matrix(r,c,2) ! 矩阵相加
	  write(*,"('(',I1,',',I1,')=',I3)") r,c,matrix(r,c,3)
	end do
  end do

  stop
end
