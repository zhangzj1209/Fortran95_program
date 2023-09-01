program main
  use IMSL
  implicit none
  real, external :: F
  integer, parameter :: N=3
  real A(N), B(N)
  real, parameter :: ERRABS = 0.0001
  real, parameter :: ERRREL = 0.001
  integer, parameter :: MAXFCN = 10000
  real errest, ans
  integer I,J, num
  
  A = 0.0
  B = 1.0  
  CALL QAND (F, N, A, B, ERRABS, ERRREL, MAXFCN, ANS, ERREST)
  write(*,*) ANS

  stop
end

real function F(N, X) ! º∆À„f(X1,X2,...Xn)
  implicit none
  integer N
  real X(N)
  F = sum(x) ! sum(x) = x(1)+x(2)+...x(n)
  return
end function