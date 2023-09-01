module sgl_util
  use sgl
  implicit none
  real, parameter :: PI = 3.14159
  real, parameter :: range = PI*3
  real, save :: left, right, top, bottom
  integer, save :: width, height
contains
  subroutine Display()
    integer, parameter :: segments = 100
	real x0,x1,y0,y1,xinc
    xinc = (right-left)/segments
    call sglClearBuffer() 
	call sglColor3i(255,0,0)
	call sglLine(0,height/2,width,height/2)
	call sglLine(width/2,0, width/2,height)
	call sglColor3i(255,255,255)
    x0 = left
	y0 = sin(x0)
	do while( x0 <= right )
	  x1 = x0+xinc
	  y1 = sin(x1)
	  call sglLineV(x0,y0, x1,y1)
	  x0 = x1
	  y0 = y1
    end do
	call sglUpdateBuffer()
  end subroutine
  subroutine resize(w, h)
    integer w, h
	real r
	width = w
	height = h
	r = real(height)/real(width)
	if ( r>1.0 ) then
	  left = -range
	  right = range
	  top = r*range
	  bottom = -r*range
	else
	  left = -range/r
	  right = range/r
	  top = range
	  bottom = -range
	end if
	call sglSetVirtual( left, top, right, bottom )
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display)
  call sglReshapeSub(resize) 
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()
  stop
end program