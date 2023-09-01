program main
  use imsl ! 在Visual Fortran使用IMSL前最好先use imsl
  implicit none
  ! f(x) = X^2-3X+2
  real :: p(3) = (/ 2.0, -3.0, 1.0 /)
  complex r(2) ! 答案是复数类型

  call zplrc( 2, p, r ) ! 求解X^2-3X+2=0
  write(*,*) r

  stop
end