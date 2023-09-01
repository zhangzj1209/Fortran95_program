program ex0914
  implicit none
  integer :: a=2
  integer :: b=3
  character(len=20) :: string
  
  write( unit=string, fmt="(I2,'+',I2,'=',I2)" ) a,b,a+b
  write(*,*) string

  stop
end program
