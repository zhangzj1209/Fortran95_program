program main
  implicit none
  integer, parameter :: max=10
  integer i
  real item
  real ans
  
  ans = 1.0  
  item = 1.0
  do i=2,max
    item = item/real(i)
    ans = ans+item
  end do
  write(*,*) ans

  stop
end program
