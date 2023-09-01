! sin函数的绘图范例
program Plot_Sine
 use DFLIB
implicit none
  integer, parameter :: lines=500	! 用多少线段来画函数曲线
  real(kind=8), parameter :: X_Start=-5.0	! x轴最小范围
  real(kind=8), parameter :: X_End=5.0		! x轴最大范围	
  real(kind=8), parameter :: Y_Top=2.0		! y轴最大范围 
  real(kind=8), parameter :: Y_Bottom=-2.0	! y轴最小范围
  integer :: result			! 取回绘图函数运行状态
  integer(kind=2) :: color	! 设定颜色用
  real(kind=8) :: step		! 循环的增量
  real(kind=8) :: x,y		! 绘图时使用,每条小线段都连接
  real(kind=8) :: NewX,NewY	! (x,y)及(NewX,NewY)
  real(kind=8), external :: f ! 待绘图的函数
  type(wxycoord) :: wt		! 返回上一次的逻辑坐标位置
  type(xycoord)  :: t		! 返回上一次的实际坐标位置

  ! 设定逻辑坐标范围大小	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! 用索引值的方法来设定颜色
  result=SetColor(2)   ! 默认的2号是应该是绿色
  call MoveTo(10,20,t) ! 移动画笔到窗口的(10,20)
  call OutGText("f(x)=sin(x)")  ! 写出内容
  ! 使用全彩RGB 0-255的256种色阶来设定颜色
  color=RGBToInteger(255,0,0)		! 把控制RGB的三个值转换到color中
  result=SetColorRGB(color)			! 利用color来设定颜色

  call MoveTo_W(X_Start,0.0_8,wt)	! 画X轴
  result=LineTo_W(X_End,0.0_8)		! 
  call MoveTo_W(0.0_8,Y_Top,wt)		! 画Y轴
  result=LineTo_W(0.0_8,Y_Bottom)	! 	

  step=(X_End-X_Start)/lines		! 计算小线段间的X间距
  ! 参数#FF0000是使用16进制的方法来表示一个整数
  result=SetColorRGB(#FF0000)		 
  ! 开始绘制小线段们
  do x=X_Start,X_End-step,step
    y=f(x)			! 线段的左端点
	NewX=x+step		
	NewY=f(NewX)	! 线段的右端点
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do
  ! 设定程序结束后,窗口会继续保留
  result=SetExitQQ(QWIN$EXITPERSIST)
end
! 所要绘图的函数
real(kind=8) function f(x)
implicit none
  real(kind=8) :: x
  f=sin(x)
  return
end function f