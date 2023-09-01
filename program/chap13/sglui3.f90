module sgl_util
  use sgl
  implicit none
  integer, save :: x=200
  integer, save :: y=200
contains
subroutine display()
  integer, parameter :: size = 20
  call sglClearBuffer()
  call sglColor3i(0,255,0)
  call sglFilledRect(x-size,y-size, x+size,y+size)
  call sglUpdateBuffer()
  return
end subroutine
subroutine idle()
  integer, parameter :: inc = 1
  call sglReadKeyboard() ! 读取目前键盘况态
  if ( sglKeyPressed(KEY_RIGHT) ) x = x+inc
  if ( sglKeyPressed(KEY_LEFT)  ) x = x-inc
  if ( sglKeyPressed(KEY_UP)    ) y = y-inc
  if ( sglKeyPressed(KEY_DOWN)  ) y = y+inc
  if ( x<0   ) x=0
  if ( x>400 ) x=400
  if ( y<0   ) y=0
  if ( y>400 ) y=400
  call display()
end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglIdleSub(idle)
  call sglDisplaySub(display)
  call sglEnableReshape(0)  
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()
  stop
end
