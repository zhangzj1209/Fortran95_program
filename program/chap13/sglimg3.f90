module sgl_util
  use sgl
  implicit none
  integer(1), save :: mountain(3*512*512)
  integer(4), save :: mountain4(3*512*512/4)
  integer(1), save :: ufo(3*512*512)
  integer(4), save :: ufo4(3*512*512/4)
  integer, save :: x=0, y=0
  integer, save :: xinc = 3, yinc = 3
  equivalence(mountain, mountain4)
  equivalence(ufo,ufo4)
contains
  subroutine display()
    call sglDisableColorKey()
    call sglPutRGBBuffer(mountain,0,0,512,512)
	call sglEnableColorKey()
	call sglColorKey3i(0,0,0)
	call sglPutRGBBuffer(ufo, x, y, 60, 60)
	call sglUpdateBuffer()
  end subroutine
  subroutine idle()
    x = x+xinc
	y = y+yinc
	if ( x<0 .or. x>=512-60 ) xinc = -xinc
	if ( y<0 .or. y>=512-60 ) yinc = -yinc
	call display()
  end subroutine
  subroutine readbuffer(filename, buffer, size)
  character(*) :: filename
  integer :: size, buffer(size)
  integer i, err
  open(10, file=filename,&
       form="unformatted",access="direct",&
	   recl=1,status="old",iostat=err)
  if (err/=0) then
    write(*,*) "Open file fail."
	stop
  end if
  do i=1,size
    read(10,rec=i) buffer(i)
  end do
  close(10)
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call readbuffer("512x512.raw",mountain4,512*512*3/4)
  call readbuffer("ufo.raw",ufo4,60*60*3/4)
  call sglIdleSub(idle)
  call sglDisplaySub(display)
  call sglEnableReshape(0)
  call sglCreateWindow(50,50,512,512,1)
  call sglMainLoop()
  stop
end program