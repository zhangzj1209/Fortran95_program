module sgl_util
  use sgl
  implicit none
  integer(1), save :: buffer(512*512)
  integer(4), save :: buffer4(512*512/4)
  equivalence(buffer,buffer4)
contains
  subroutine display()
    call sglPutBuffer(buffer,0,0,256,256)
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
  subroutine getkey(key)
    integer key
    if ( key==27 ) call sglEnd()
    call display()
  end subroutine
  subroutine setpalette()
    integer i
    do i=0,255
      call sglSetPalette(i, i,i,i) ! Éè¶¨»Ò½×ÑÕÉ«
    end do
    call sglUpdatePalette()
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call readbuffer("lena.raw",buffer4,256*256/4)
  call sglDisplaySub(display)
  call sglGetCharSub(getkey)
  call sglFullScreen(640,480,8,0)
  call setpalette()
  call sglMainLoop()
  stop
end program