program main
  use IMSL
  implicit none
  real, external :: F
  integer, parameter :: KORDER = 1 
  real :: x=0.0
  real, parameter :: BGSTEP = 1E-3
  real, parameter :: TOL = 1E-3
  write(*,*) DERIV(F, KORDER, X, BGSTEP, TOL)
  stop
end

real function F(X)
  real X
  F = sin(X)
  return
end function