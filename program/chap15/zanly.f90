program main
  use IMSL
  implicit none
  integer, parameter :: N = 3
  integer :: INFO(N)
  integer, parameter :: ITMAX = 100
  integer, parameter :: NKNOWN = 0
  integer, parameter :: NNEW = N, NGUESS = N
  complex :: ZINIT(N) = (/ (1.0, 0.0), (2.0,0.0), (3.0,0.0) /)
  real, parameter :: ERRABS = 0.0001
  real, parameter :: ERRREL = 0.0001
  complex, external :: F
  complex :: Z(N)

  CALL ZANLY (F, ERRABS, ERRREL, NKNOWN, NNEW, NGUESS, ZINIT,&
  ITMAX, Z, INFO)
  write(*,"(3('('F5.2','F5.2') '))") Z

  stop
end program

complex function F (Z)
  complex Z
  F = (Z-5.0)*(Z-4.0)*(Z)
  return
end function
