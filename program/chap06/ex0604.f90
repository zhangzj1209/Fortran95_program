program ex0604
implicit none
  integer, parameter :: limit=10  ! ������������
  integer counter      ! ������
  integer :: ans = 0   ! �����ۼ�ʹ��

  counter = 2  ! �趨��������ֵ
  do while( counter <= limit )
    ans = ans + counter
    counter = counter + 2  ! �������ۼ�
  end do

  write(*,*) ans

  stop
end
