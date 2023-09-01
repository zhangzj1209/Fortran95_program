program main
  implicit none
  integer i,sum
  sum = 0
  do i=1,99,2
    sum = sum+i
  end do
  write(*,*) sum
  stop
end program
