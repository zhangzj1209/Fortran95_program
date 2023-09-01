module sgl_util
  use sgl
  implicit none
  integer(1), save :: buffer(3*512*512)
  integer(4), save :: buffer4(3*512*512/4)
  equivalence(buffer,buffer4)
contains
  subroutine display()
    integer x,y
    integer base
    integer r,g,b
    base = 0
    do y=1,512
      do x=1,512
        r = buffer(base+1)
        g = buffer(base+2)
        b = buffer(base+3)
        if ( r<0 ) r = r+256
        if ( g<0 ) g = g+256
        if ( b<0 ) b = b+256
        call sglColor3i( r,g,b )
        call sglPixel(x,y)
        base = base+3
      end do
    end do
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
