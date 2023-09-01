program main
  implicit none
  integer, parameter :: max = 10
  integer i
  integer :: a(max) = (/ (2*i, i=1,10) /)
  integer :: t
  ! sum()ÊÇfortran¿âº¯Êý  
  write(*,*) real(sum(a))/real(max)
  
  stop
end program
