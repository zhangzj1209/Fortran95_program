program ex0705
implicit none
  integer, parameter :: row = 2
  integer, parameter :: col = 2
  integer :: matrix(row, col, 3)
  integer m ! ����ָ���ڼ�������
  integer r ! ����ָ��row
  integer c ! ����ָ��column

  ! ������������
  do m=1, 2
  write(*,"('Matrix ',I1)") m
    do r=1, row
      do c=1, col
        write(*,"('(',I1,',',I1,')=')") r,c
	    read(*,*) matrix(r,c,m)
	  end do
    end do
  end do

  ! �ѵ�1,2���������
  write(*,*) "Matrix 1 + Matrix 2 = "
  do r=1, row
    do c=1, col
	  matrix(r,c,3) = matrix(r,c,1)+matrix(r,c,2) ! �������
	  write(*,"('(',I1,',',I1,')=',I3)") r,c,matrix(r,c,3)
	end do
  end do

  stop
end
