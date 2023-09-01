module NUMERICAL
  implicit none
  real, parameter :: zero=0.00001  ! 小于zero的值会被当成0
contains
! 割线法的函数
  real function newton(a,f,df)
  implicit none
  real :: a	  ! 起始的猜值
  real, external :: f	! 传入的求值函数
  real, external :: df  ! f'(x)的函数
  real :: b	  ! 逼近得到解
  real :: fb  ! 记录f(a),f(b),f(c)

  b = a-f(a)/df(a)
  fb= f(b)
! 在驱近于0 之前要一直做逼近的工作
  do while( abs(fb) > zero )
	a=b
	b=a-f(a)/df(a)
    fb=f(b)
  end do
  newton=b
  return
  end function newton
  ! 求值的函数
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
  real :: a	  ! 起始猜值
  real :: ans ! 解
  write(*,*) "输入起始猜值"
  read (*,*) a
  ! 传入起始猜值及求值的函数
  ans=newton(a,func,dfunc)
  write(*,"('x=',F8.4)") ans
  stop
end program
