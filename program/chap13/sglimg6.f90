module sgl_util
  use sgl
  implicit none
  type palette
    integer r,g,b
  end type
  type(palette), save :: table(0:255)
contains
  subroutine display()
    integer i,l
	call sglClearBuffer()
	do i=0, 255
	  call sglColor(i)
	  call sglRect(400-i,300-i,400+i,300+i)
	end do
  end subroutine
  subroutine getkey(key)
    integer key
    if ( key==27 ) call sglEnd()
    call display()
  end subroutine
  subroutine initpalette()
    integer i
    do i=0,255
	  table(i) = palette( i,0,0 )
    end do
  end subroutine
  subroutine setpalette()
    integer i
	do i=0,255
	  call sglSetPalette( i, table(i)%r, table(i)%g, table(i)%b )
	end do
	call sglUpdatePalette
  end subroutine
  subroutine changepalette()
    integer i
	type(palette) :: c1
	c1 = table(1)
	do i=1,254
	  table(i) = table(i+1)
	end do
    table(255)=c1
	call setpalette()
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(display)
  call sglGetCharSub(getkey)
  call sglTimerSub(10, changepalette)
  call sglFullScreen(800,600,8,0)
  call initpalette()
  call setpalette()
  call sglMainLoop()
  stop
end program