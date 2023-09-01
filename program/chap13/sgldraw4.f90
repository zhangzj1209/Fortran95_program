module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    call sglClearBuffer() 
	call sglColor3f(1.0,0,0) 
	call sglFilledRect(100,100, 120,200) ! À¯Öò
	call sglFilledRectV(0.5, 0.5, 0.58, 0.9)
	call sglColor3f(1.0,1.0,0.0)
	call sglFilledEllipse(110, 70, 5,30) ! »ðÑæ
	call sglArc( 110, 70, 50, 0.0, 3.14159) ! ¹â»·
	call sglFilledEllipseV(0.54,0.4, 0.03, 0.1)
	call sglArcV(0.54,0.4,0.4, 0.0, 3.14159)
	call sglUpdateBuffer();
  end subroutine
  subroutine resize(width, height)
    integer width, height
	real r
	r = real(height)/real(width)
	if ( r>1.0 ) then
	  call sglSetVirtual(-1.0, -r, 1.0, +r)
	else
	  call sglSetVirtual(-1.0/r, -1.0, 1.0/r, 1.0)
	end if
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display)
  call sglReshapeSub(resize) 
  call sglSetVirtual(-1.0, -1.0, 1.0, 1.0)
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()
  stop
end program