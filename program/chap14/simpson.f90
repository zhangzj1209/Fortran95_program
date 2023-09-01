module INTEGRAL
  implicit none
  real, parameter :: PI=3.14159
contains
! 产生数列
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
! 梯形法积分
real function Simpson_Integral(datas, width)
  IMPLICIT NONE
  real datas(:), width
  real sum
  integer i,n
  n = size(datas,1)
  if ( mod(n,2)==0 ) then
    write(*,*) "要有奇数条数据"
	stop
  end if
  sum = datas(1) + datas(n) ! 先算出头尾的和
  do i=2,n-1
    if ( mod(i,2)==0 ) then
      sum = sum + 4*datas(i) ! 把4*f(x)的部分累加起来
	else
      sum = sum + 2*datas(i) ! 把2*f(x)的部分累加起来
	end if
  end do
  Simpson_Integral = sum * width/3.0        ! SUM再乘上H/3 就好了
  return
end function
end module
! SIMPSON法积分范例
program main
  use INTEGRAL
  implicit none
  integer, parameter :: N = 9
  real, intrinsic :: sin
  real datas(N), width
  call GenerateData(datas, width, sin)
  write(*,"('ans=',F6.2)") simpson_integral(datas, width)
  stop
end program
