module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! 小于zero的值会被当成0
contains
! 割线法的函数
  real function secant(a,b,f)
  implicit none
  real :: a,b ! 起始的两个猜值
  real :: c	  ! 新的解
  real, external :: f ! 传入的求解函数
  real :: fa,fb,fc	! 记录f(a),f(b),f(c)

  fa=f(a)
  fb=f(b)
  c=a-fa*(b-a)/(fb-fa)
  fc=f(c)
! 在驱近于0 之前要一直做逼近的工作
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
  real :: a,b	! 起始猜值
  real :: ans	! 算得的解
  write(*,*) "输入两个猜值"
  read (*,*) a,b
  ! 传入起始猜值及求值的函数
  ans=secant(a,b,func)
  write(*,"('x=',f8.4)") ans
  stop
end program
