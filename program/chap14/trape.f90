module INTEGRAL
  implicit none
  real, parameter :: PI=3.14159
contains
! ��������
  subroutine GenerateData(datas, width, func)
    real datas(:), width
	real, external :: func
	real r
	integer i,n
	n = size(datas,1)
	width = PI/(n-1)
	r = 0
	do i=1,n
	  datas(i) = func(r)
	  r = r+width
	end do
  end subroutine
! ���η�����
  real function Trape_Integral(datas, width)
    implicit none
    real datas(:)
    real width     ! ÿ�����ݵļ��
    real SUM       ! ���������ϵ׼��µ׳��Զ��ĺ�
    integer i,n
    n = size(datas,1)
    SUM = (datas(1)+datas(n))/2.0
    do i=2,n-1
      SUM=SUM+datas(i) ! �ۼӱ߳�
    end do
    Trape_Integral=SUM*width  ! ���������
    return
  end function 
end module
! ���η����ַ���
program main
  use INTEGRAL
  implicit none
  integer, parameter :: N = 10
  real DATAS(N), width
  real ANS  ! ��  
  real, intrinsic :: sin ! ģ�������������ݵĺ���
  call GenerateData(DATAS, width, sin)
  ANS = Trape_Integral(DATAS, width)  ! �������
  write(*,"('ans=',F5.2)") ANS        ! д����
  stop
end program