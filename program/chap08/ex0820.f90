program ex0820
implicit none
  call sub()
  call sub()
  call sub()
  stop
end program

subroutine sub()
  implicit none
  integer :: count = 1
  save    count      ! ָ��count��������Զ����, ����������������
  write(*,*) count
  count = count+1
  return
end