module sgl_util
  use sgl
  implicit none
contains
subroutine display()
  integer, parameter :: size = 200
  real, parameter :: rinc = 0.002
  real, save :: radian = 0.0
  integer :: x,y
  x = int(sin(radian)*size)
  y = int(cos(radian)*size)
  radian = radian + rinc
  call sglClearBuffer()
  call sglDrawLine(200-x, 200-y, 200+x, 200+y)
  call sglUpdateBuffer()
  return
end subroutine
end module
! ÕâÊÇ´íÎó·¶Àý
program main
  use sgl_util
  implicit none
  integer i
  call sglCreateWindow(100,100,400,400,1)
  call sglColor3i(255,255,255)
  do i=1,5000
    call display()
  end do
  stop
end
