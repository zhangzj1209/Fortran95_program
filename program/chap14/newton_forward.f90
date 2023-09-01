module INTERPOLATE_UTILITY
  use sgl
  implicit none
  type point
    real x,y
  end type
  real, parameter :: PI=3.14159
  real, parameter :: xmin = 0.0, xmax = PI*3.0
  integer, parameter :: N = 10, NP = 100
  type(point), save :: datas(N)
  type(point), save :: interpolate(NP)
  real, save :: table(N,N), width
contains
! 产生数列
  subroutine GenerateData(func)
	real, external :: func
	real r
	integer i
	width = (xmax-xmin)/(N-1)
	r = 0
	do i=1,N
	  datas(i)%x = r
	  datas(i)%y = func(r)
	  r = r+width
	end do
  end subroutine
! 建立difference table
  subroutine BuildTable()
    integer row,col,i
	!real table(N,N)
	table = 0
	do i=1,N
	  table(i,1) = datas(i)%y
	end do
    do col=2,N
	  do row=1,N-col+1
		table(row,col) = table(row+1, col-1) - table(row, col-1)
	  end do
	end do
  end subroutine
  real function newton(x, th, num)
	real x
	integer th, num
    real s, sum, coeff
	integer f,i,j
    
	if ( th+num-1 > N ) then
	  write(*,*) "数据点不足"
	  return
	end if

	newton = table(th,1)
	s = (x-datas(th)%x)/width
	f = 1
	coeff = 1.0
    do i=1,num-1
	  f = f*i
	  coeff = coeff*(s-i+1)
	  newton = newton + coeff*table(th,i+1)/real(f)
	end do
  end function
! 绘图函数
  subroutine display()
    real, parameter :: size = 0.1
    integer i
    call sglClearBuffer()
	call sglColor3i(255,255,255)
	! 把所有插值出来的点用线段连接起来
    do i=1,NP-1
	  call sglLineV( interpolate(i)%x, interpolate(i)%y,&
	                 interpolate(i+1)%x, interpolate(i+1)%y)
	end do
	call sglColor3i(255,0,0)
	! 画出n个数据点的位置
	do i=1,N
      call sglLineV( datas(i)%x-size, datas(i)%y-size,&
	                 datas(i)%x+size, datas(i)%y+size)
      call sglLineV( datas(i)%x+size, datas(i)%y-size,&
	                 datas(i)%x-size, datas(i)%y+size)
	end do
	call sglUpdateBuffer()
  end subroutine
end module

program main
  use INTERPOLATE_UTILITY
  implicit none
  real, intrinsic :: sin
  real xinc,x
  integer i

  call GenerateData(sin) ! 产生数据点
  call BuildTable()
  x=0
  xinc = (xmax-xmin)/(NP-1)
  do i=1,NP
    interpolate(i)%x = x
    interpolate(i)%y = newton(x,1,N) ! 插值出f(x)的值
	x = x+xinc
  end do
  
  call sglDisplaySub(display)
  call sglSetVirtual(xmin, 2.0, xmax, -2.0)
  call sglCreateWindow(100,100,400,400,1)
  call sglMainLoop()

  stop
end program
