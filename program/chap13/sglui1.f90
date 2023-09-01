module sgl_util
  use sgl
  implicit none
  integer, save :: x=100
  integer, save :: y=100
contains
subroutine display()
  integer, parameter :: size = 20
  call sglClearBuffer()
  call sglColor3i(255,0,0)
  call sglDrawFilledRect(x-size,y-size, x+size,y+size)
  call sglUpdateBuffer()
  return
end subroutine
subroutine getchar(key)
  integer key
  character ckey
  integer, parameter :: inc = 3
  ckey = char(key)
  write(*,"('input:'A1)") ckey
  select case(ckey)
  case('a','A')
    x = x-inc  
  case('d','D')
    x = x+inc
  case('w','W')
    y = y-inc
  case('s','S')
    y = y+inc
  end select
  if ( x<0 )   x=0
  if ( x>400 ) x=400
  if ( y<0 )   y=0
  if ( y>400 ) y=400
  call display() ! ����display����ǿ�ȸ��»���
end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(display)
  call sglGetCharSub(getchar) ! �趨����һ���ַ�ʱ����õĺ���
  call sglEnableReshape(0) ! �������ڴ�С�ı�
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()
  stop
end
