program main
  use IMSL
  implicit none
  real A, B
  real, parameter :: ERRABS = 0.001
  real, parameter :: ERRREL = 0.001
  integer, parameter :: IRULE = 6
  real, external :: F,G,H
  real :: ANS
  real :: ERREST
  A = 0.0
  B = 5.0
  call TWODQ (F, A, B, G, H, ERRABS, ERRREL, IRULE, ANS, ERREST)
  write(*,*) ANS
  stop
end program

real function F(X,Y)
  implicit none
  real X, Y
  F = X+Y
  return
end function

real function G(X)
  implicit none
  real X
  G = 0.0
  return
end function

real function H(X)
  implicit none
  real X
  H = 5.0
  return
end function
