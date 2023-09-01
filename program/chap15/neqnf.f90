program main
  use IMSL
  implicit none
  external FCN
  real, parameter :: ERRREL = 0.0001
  integer, parameter :: N = 3
  integer, parameter :: ITMAX = 100
  real :: XGUESS(N) = (/ 0.0, 1.0, 2.0 /)
  real X(N), FNORM

  CALL NEQNF (FCN, ERRREL, N, ITMAX, XGUESS, X, FNORM)
  write(*,*) X

  stop
end

subroutine FCN (XA, F, N)
  implicit none
  integer N
  real, target :: XA(N)
  real F(N)
  real, pointer :: x,y,z
  ! 在计算时使用x,y,z看起来比较清楚
  x=>XA(1)
  y=>XA(2)
  z=>XA(3)

  F(1) = x*x + y*y + z*z -3
  F(2) = x*y + y*z + x*z -3
  F(3) = exp(x) + exp(y) + exp(z) -3*exp(1.0)

  return
end subroutine