module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! С��zero��ֵ�ᱻ����0
contains
! ���߷��ĺ���
  real function secant(a,b,f)
  implicit none
  real :: a,b ! ��ʼ��������ֵ
  real :: c	  ! �µĽ�
  real, external :: f ! �������⺯��
  real :: fa,fb,fc	! ��¼f(a),f(b),f(c)

  fa=f(a)
  fb=f(b)
  c=a-fa*(b-a)/(fb-fa)
  fc=f(c)
! ��������0 ֮ǰҪһֱ���ƽ��Ĺ���
  do while( abs(fc) > zero )
	a=b
	b=c
	fa=f(a)
	fb=f(b)
    c=a-fa*(b-a)/(fb-fa)
    fc=f(c)
  end do
  secant=c
  return
  end function secant
  real function func(x)
    implicit none
    real :: x
    func=sin(x)
    return
  end function func
end module numerical

program main
  use NUMERICAL
  implicit none
  real :: a,b	! ��ʼ��ֵ
  real :: ans	! ��õĽ�
  write(*,*) "����������ֵ"
  read (*,*) a,b
  ! ������ʼ��ֵ����ֵ�ĺ���
  ans=secant(a,b,func)
  write(*,"('x=',f8.4)") ans
  stop
end program
