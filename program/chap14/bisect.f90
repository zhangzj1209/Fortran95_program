!	二分法求解
!	By Pon 1997/9/2
module NUMERICAL
  implicit none
  real, parameter :: zero = 0.00001
contains
  real function bisect( A, B, func )
    implicit none
	real A,B	! 输入的猜值
	real C		! 用来算(A+B)/2
	real FA		! 记录F(A)
	real FB		! 记录F(B)
	real FC		! 记录F(C)
	real, external :: func ! 所要求解的函数

!	先求出C, F(C)的值
	C = (A+B)/2.0	
	FC = func(C)

!   F(C) 小于 ZERO 时,就视 F(C)=0 , 结束循环
	do while( abs(fc) > zero )
	  FA = func(A)
	  FB = func(B)
	  if ( FA*FC < 0 ) then
	  ! f(a)*f(c)<0 ,以a,c值为新的区间
		B=C
		C=(A+B)/2.0
	  else
	  ! 不然就是以b,c为新的区间
		A=C
		C=(A+B)/2.0
	  end if
      ! 求出新的f(c)值
		FC=FUNC(C)
	end do
	bisect = C
	return
	end function
!	求解用的函数1
	real function f1(X)
	implicit none
	real X
	f1=(X+3)*(X-3)
	return
	end function
!	求解用的函数
	real function f2(X)
	implicit none
	real X
	f2=(X+4)*(X-5)
	return
	end function

end module

program main
  use NUMERICAL
  implicit none
  real  A,B		! 两个猜值
  real  ANS		! 算出的值
  do while(.true.)
	write(*,*) '输入两个猜测值'
	read (*,*) A,B
    ! f(a)*f(b) < 0 的猜值才是有效的猜值
	if ( f1(A)*f1(B) < 0 ) exit
	write(*,*) "不正确的猜值"
  end do
  ! 调用二叉法求根的函数
  ANS=bisect( A, B, f1 )
  ! 写出结果
  write(*,"('x=',F6.3)") ans

  do while(.true.)
	write(*,*) '输入两个猜测值'
	read (*,*) A,B
    ! f(a)*f(b) < 0 的猜值才是有效的猜值
	if ( f2(A)*f2(B) < 0 ) exit
	write(*,*) "不正确的猜值"
  end do
  ! 调用二叉法求根的函数
  ANS=bisect( A, B, f2 )
  ! 写出结果
  write(*,"('x=',F6.3)") ans

  stop
end

