module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! С��zero��ֵ�ᱻ����0
contains
! ���߷��ĺ���
  real function newton(a,f,df)
  implicit none
  real :: a	  ! ��ʼ�Ĳ�ֵ
  real, external :: f	! �������ֵ����
  real, external :: df  ! f'(x)�ĺ���
  real :: b	  ! �ƽ��õ���
  real :: fb  ! ��¼f(a),f(b),f(c)

  b = a-f(a)/df(a)
  fb= f(b)
! ��������0 ֮ǰҪһֱ���ƽ��Ĺ���
  do while( abs(fb) > zero )
	a=b
	b=a-f(a)/df(a)
    fb=f(b)
  end do
  newton=b
  return
  end function newton
  ! ��ֵ�ĺ���
  real function func(x)
    implicit none
    real :: x
    func=sin(x)
    return
  end function func
  ! func'(x)
  real function dfunc(x)
    implicit none
    real :: x
    dfunc=cos(x)
    return
  end function dfunc
end module NUMERICAL

program main
  use numerical
  implicit none
  real :: a	  ! ��ʼ��ֵ
  real :: ans ! ��
  write(*,*) "������ʼ��ֵ"
  read (*,*) a
  ! ������ʼ��ֵ����ֵ�ĺ���
  ans=newton(a,func,dfunc)
  write(*,"('x=',F8.4)") ans
  stop
end program
