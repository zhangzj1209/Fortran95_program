program ex0602
implicit none
  integer, parameter :: limit=10  ! ������������
  integer counter      ! ������
  integer :: ans = 0   ! �����ۼ�ʹ��

  do counter=2, limit ,2
    ans = ans + counter
  end do
  write(*,*) ans

  stop
end
