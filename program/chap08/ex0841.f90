program ex0841
  implicit none
  include 'ex0841.inc'  ! ����ex0841.inc������
  a=1
  b=2
  call sub()
  stop
end 

subroutine sub()
  implicit none
  include 'ex0841.inc'  ! ����ex0841.inc������
  write(*,*) a,b
  return
end
