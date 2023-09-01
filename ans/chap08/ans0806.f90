program main
  use TextGraphLib
  implicit none
  integer, parameter :: maxx=60, maxy=20
  real, parameter :: StartX=0.0, EndX=3.14159*2.0
  real, parameter :: xinc = (EndX-StartX)/(maxx-1)
  real x
  integer i,px,py

  call SetScreen(60,20)
  call SetCurrentChar('*')
  x=StartX
  do px=1,maxx
    py = (maxy/2)*sin(x)+maxy/2+1
    call PutChar(px,py)
	x=x+xinc
  end do
  call UpdateScreen()

  stop
end program