program main
  use IMSL
  implicit none
  real, external :: F
  real :: BOUND = 1.0
  integer :: INTER = 1
  real, parameter :: ERRABS = 1E-3
  real, parameter :: ERRREL = 1E-3
  real ANS, ERR

  call QDAGI (F, BOUND, INTER, ERRABS, ERRREL, ANS, ERR)
  write(*,"('����ֵ='F5.2,' ������Χ:'F6.4)") ANS, ERR

  stop
end

real function F(X)
  implicit none
  real X
  F = 1.0/(x*x)
  return
end function
