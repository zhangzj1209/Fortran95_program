program main
  use imsl ! ��Visual Fortranʹ��IMSLǰ�����use imsl
  implicit none
  ! f(x) = X^2-3X+2
  real :: p(3) = (/ 2.0, -3.0, 1.0 /)
  complex r(2) ! ���Ǹ�������

  call zplrc( 2, p, r ) ! ���X^2-3X+2=0
  write(*,*) r

  stop
end