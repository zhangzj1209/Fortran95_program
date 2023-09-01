module sgl_util
  use sgl
  implicit none
  integer(1), save :: buffer(3*512*512)
  integer(4), save :: buffer4(3*512*512/4)
  equivalence(buffer,buffer4)
contains
  subroutine display()
    call sglPutRGBBuffer(buffer,0,0,512,512)
  end subroutine
end module

program main
  use sgl_util
  implicit none
  integer i
  
  open(10, file="512x512.raw",&
       form="unformatted",access="direct",&
	   recl=1,status="old")
  do i=1,512*512*3/4
    read(10,rec=i) buffer4(i)
  end do
  close(10)
  call sglDisplaySub(display)
  call sglEnableReshape(0)
  call sglCreateWindow(50,50,512,512,0)
  call sglMainLoop()
  stop
end program