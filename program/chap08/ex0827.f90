program  ex0827
  implicit none
  interface
    real function func(x,a,b,c) ! �����ӳ�ʽfunc�Ľӿ�
    implicit none
	real x
    real, optional :: a,b,c
    end function 
  end interface

  write(*,*) func(2.0, c=1.0)        ! F(2)=0*2^2 + 0*2 + 1 = 1
  write(*,*) func(2.0, a=2.0, b=1.0) ! F(2)=2*2^2 + 1*2 + 0 = 10
  stop
end
! ����func(X)=A*X^2+B*X+C
! A,B,C������Ļ�Ϊ0
real function func(x,a,b,c)
  implicit none
  real x  ! xֵһ��Ҫ����
  real, optional :: a,b,c ! a,b,c���Բ�����
  real ra, rb, rc         ! ʵ�ʼ��������

  if ( present(a) ) then
    ra=a
  else
    ra=0.0 ! Ĭ��ֵΪ0
  end if

  if ( present(b) ) then
    rb=b
  else
    rb=0.0 ! Ĭ��ֵΪ0
  end if

  if ( present(c) ) then
    rc=c
  else
    rc=0.0 ! Ĭ��ֵΪ0
  end if
  ! func(x)=A*X^2+B*X+C
  func = ra*x**2 + rb*x + rc

  return
end 
