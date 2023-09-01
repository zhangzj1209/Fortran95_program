program  ex0803
  implicit none
  integer :: a = 1
  call sub1()
  write(*,"('a =',I2)") a
  stop
end program ex0803 

subroutine sub1()
  implicit none
  integer :: a=2
  write(*,"('a =',I2)") a
  return
end subroutine sub1

