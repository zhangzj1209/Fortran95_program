program main
  use IMSL
  implicit none
  real, external :: F
  real A, B
  integer, parameter :: NPTS = 2
  real :: POINTS(NPTS) = (/ 1.0, 2.0 /)
  real, parameter :: ERRABS = 1E-2
  real, parameter :: ERRREL = 1E-2
  real ANS, ERR

  A = 0.0
  B = 3.0
  CALL QDAGP (F, A, B, NPTS, POINTS, ERRABS, ERRREL, ANS, ERR)
  write(*,"('积分值='F5.2,' 估计误差范围:'F6.4)") ANS, ERR

  stop
end

real function F(X)
  implicit none
  real X
  F = LOG( abs((X-1.0)*(X-2.0)) )
  return
end function
