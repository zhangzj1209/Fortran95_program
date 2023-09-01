program main
  use IMSL
  implicit none
  real, parameter :: ERRABS = 0.0
  real, parameter :: ERRREL = 0.001
  integer :: MAXFN = 100
  real :: A,B
  real, external :: F
  A=-1.0
  B=1.0
  call ZBREN (F, ERRABS, ERRREL, A, B, MAXFN)
  write(*,*) B,MAXFN
end program

real function F(X)
  implicit none
  real X
  F = sin(x)
  return
end function