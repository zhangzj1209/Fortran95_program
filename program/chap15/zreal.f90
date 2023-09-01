program main
  use IMSL
  implicit none
  integer, parameter :: ITMAX = 100
  integer, parameter :: NROOT = 2
  real, parameter :: EPS = 1.0E-6
  real, parameter :: ERRABS = 1.0E-6
  real, parameter :: ERRREL = 1.0E-6
  real, parameter :: ETA = 1.0
  integer INFO(NROOT)
  real, external :: f
  real :: X(NROOT)
  real :: XGUESS(NROOT) = (/ 1.0, 4.0 /)
  
  call ZREAL (f, ERRABS, ERRREL, EPS, ETA, &
              NROOT, ITMAX, XGUESS, X, INFO)
  write(*,*) X
  stop
end program

real function f(x)
  implicit none
  real x
  f=sin(x)
  return
end function