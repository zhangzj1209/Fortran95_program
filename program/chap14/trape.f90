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
  real function Trape_Integral(datas, width)
    implicit none
    real datas(:)
    real width     ! 每条数据的间隔
    real SUM       ! 计算所有上底加下底除以二的和
    integer i,n
    n = size(datas,1)
    SUM = (datas(1)+datas(n))/2.0
    do i=2,n-1
      SUM=SUM+datas(i) ! 累加边长
    end do
    Trape_Integral=SUM*width  ! 计算面积和
    return
  end function 
end module
! 梯形法积分范例
program main
  use INTEGRAL
  implicit none
  integer, parameter :: N = 10
  real DATAS(N), width
  real ANS  ! 答案  
  real, intrinsic :: sin ! 模拟用来产生数据的函数
  call GenerateData(DATAS, width, sin)
  ANS = Trape_Integral(DATAS, width)  ! 计算积分
  write(*,"('ans=',F5.2)") ANS        ! 写出答案
  stop
end program