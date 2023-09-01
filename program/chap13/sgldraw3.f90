module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    call sglClearBuffer() 
	call sglColor3f(1.0,0,0) 
	call sglRectV(-0.6, -0.6, 0.6, 0.6)
    call sglColor3i(0,255,0) 
    call sglCircleV(0.0,0.0,1.0) 
	call sglColor3i(0,0,255) 
	call sglLineV(-1.0, 0, 1.0, 0) 
	call sglLineV(0, -1.0, 0.0, 1.0)
	call sglUpdateBuffer();
  end subroutine
  subroutine resize(width, height)
    integer width, height
	real r
	write(*,"('size:'I4' x'I4)") width, height
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
  ! 设定当窗口大小改变时会调用resize
  call sglReshapeSub(resize) 
  ! 设定窗口左上角的虚拟座标为(0,0)右下角为(1.0,1.0)
  call sglSetVirtual(-1.0, -1.0, 1.0, 1.0)
  call sglCreateWindow(100,100,500,500,1)
  call sglMainLoop()
  stop
end program