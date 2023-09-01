module SGL_UTIL
  use SGL
  implicit none
contains
  subroutine display()
    call sglClearColor3i(255,255,255)
    call sglClearBuffer()
	call sglColor3i(0,0,0)
	call sglTextOut(50,50,"大家好")
	call sglUpdateBuffer()
  end subroutine
end module SGL_UTIL

program main
  use SGL_UTIL
  implicit none

  call sglDisplaySub(display)
  call sglCreateWindow(100,100,400,200,1)
  call sglUseFont("标楷体",50,100)
  !call sglUseFont("Time New Roman",50,100)
  call sglMainLoop()

  stop
end program