module SGL_UTIL
  use SGL
  implicit none
contains
  subroutine display()
    call sglClearBuffer()
	call sglColor3i(255,255,255)
	call sglTextOut( 100, 100, "HELLO" )
	call sglUpdateBuffer()
  end subroutine
end module SGL_UTIL

program main
  use SGL_UTIL
  implicit none

  call sglDisplaySub(display)
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()

  stop
end program