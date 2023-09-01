!	���ַ����
!	By Pon 1997/9/2
module NUMERICAL
  implicit none
  real, parameter :: zero = 0.00001
contains
  real function bisect( A, B )
    implicit none
	real A,B	! ����Ĳ�ֵ
	real C		! ������(A+B)/2
	real FA		! ��¼F(A)
	real FB		! ��¼F(B)
	real FC		! ��¼F(C)

!	�����C, F(C)��ֵ
	C = (A+B)/2.0	
	FC = func(C)

!   F(C) С�� ZERO ʱ,���� F(C)=0 , ����ѭ��
	do while( abs(fc) > zero )
	  FA = func(A)
	  FB = func(B)
	  if ( FA*FC < 0 ) then
	  ! f(a)*f(c)<0 ,��a,cֵΪ�µ�����
		B=C
		C=(A+B)/2.0
	  else
	  ! ��Ȼ������b,cΪ�µ�����
		A=C
		C=(A+B)/2.0
	  end if
      ! ����µ�f(c)ֵ
		FC=FUNC(C)
	end do
	bisect = C
	return
	end function
!	����õĺ���
	real function func(X)
	implicit none
	real X
	FUNC=(X+3)*(X-3)
	return
	end function
end module

program main
  use NUMERICAL
  implicit none
  real  A,B		! ������ֵ
  real  ANS		! �����ֵ
  do while(.true.)
	write(*,*) '���������²�ֵ'
	read (*,*) A,B
    ! f(a)*f(b) < 0 �Ĳ�ֵ������Ч�Ĳ�ֵ
	if ( func(A)*func(B) < 0 ) exit
	write(*,*) "����ȷ�Ĳ�ֵ"
  end do
  ! ���ö��淨����ĺ���
  ANS=bisect( A, B )
  ! д�����
  write(*,"('x=',F6.3)") ans
  stop
end

