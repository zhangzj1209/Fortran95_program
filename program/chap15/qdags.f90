program main
  use IMSL
  implicit none
  integer NOUT
  real, external :: F
  real A, B
  real, parameter :: ERRABS = 1E-5
  real, parameter :: ERRREL = 1E-5
  real ANS, ERR

  A = 0.0
  B = 3.14159
  CALL QDAGS (F, A, B, ERRABS, ERRREL, ANS, ERR)
  write(*,"('积分值='F5.2,' 估计误差范围:'F6.4)") ANS, ERR

END

real function F(X)
  implicit none
  real X
  F = sin(X)
  return
end function
