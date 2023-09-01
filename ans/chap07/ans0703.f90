program main
  implicit none
  integer, parameter :: max=10
  integer f(max)
  integer i

  f(1)=0
  f(2)=1
  
  do i=3,max
    f(i)=f(i-1)+f(i-2)
  end do
  
  write(*,"(10I4)") f
  
  stop
end program
