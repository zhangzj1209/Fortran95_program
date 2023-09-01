program ex0917
  implicit none
  integer :: a=2
  integer :: b=3
  character(len=20) :: string
  character(len=20) :: fmtstring="(I??'+'I??'='I??)"

  write(fmtstring(3:4),"(I2.2)") int(log10(real(a))+1)
  write(fmtstring(7:8),"(I2.2)") int(log10(real(b))+1)
  write(fmtstring(10:11),"(I2.2)") int(log10(real(a+b))+1)
  write(*,*) fmtstring

  stop
end program

