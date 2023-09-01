! Interactive的绘图范例
! By Perng 1997/9/20
program Plot_Sine
use DFLIB
implicit none
  logical :: result
  integer :: input		
  type(WindowConfig) :: wc
  real(kind=8), external :: f1,f2,f3	! 所要绘的函数
  ! 打开输入用的窗口
  open(unit=5,file='user',iofocus=.true.)
  ! -1 代表由程序自行去做决定
  wc.numxpixels=300 ! 窗口的宽
  wc.numypixels=300 ! 窗口的高
  wc.numtextcols=-1 ! 每行可容纳的文字
  wc.numtextrows=-1 ! 可以有几列文字
  wc.numcolors=-1	! 可以使用的颜色
  wc.title="Input Area"C ! 窗口的标题文字
  wc.fontsize=-1	! 所使用的文字大小
  ! 根据wc中所定义的数据来重新设定窗口大小
  result=SetWindowConfig(wc) 
  result=DisplayCursor($GCURSORON) ! 显现出游标
  ! 打开绘图所要使用的窗口
  open(unit=10,file='user',iofocus=.true.)
  wc.numxpixels=300 ! 窗口的宽
  wc.numypixels=300 ! 窗口的高
  ! -1代表让程序自行去做决定
  wc.numtextcols=-1	! 每行容量的文字
  wc.numtextrows=-1	! 可以有几列文字
  wc.numcolors=-1	! 使用多少颜色
  wc.title="Plot Area"C ! 窗口的标题
  wc.fontsize=-1
  ! 根据wc中所定义的数据来重新设定窗口大小
  result=SetWindowConfig(wc)
  ! 程序自我按下菜单中Windows的Tile命令, 使两个窗口之间
  ! 不会互相重叠
  result=ClickMenuQQ(QWIN$TILE) 
  input=1 ! 随便给一个合理的值, 不然不能进入下面的循环
  ! 把输入使用的窗口设为可以被输入的状态, 5就是第一次打开
  ! user时所用的unit值
  result=FocusQQ(5) 
  do while( input>0 .and. input<4 )
    write(5,*) '(1) Plot f(x)=sin(x)'
	write(5,*) '(2) Plot f(x)=cos(x)'
	write(5,*) '(3) Plot f(x)=(x+2)*(x-2)'
	write(5,*) 'Other to EXIT'
	read(5,*) input
	result=SetActiveQQ(10) ! 把绘图命令指定到绘图窗口的代码上
	! 根据input来决定要画出那一个函数
	select case(input)
	case (1)
	  call Draw_Func(f1)
	case (2)
	  call Draw_Func(f2)
	case (3)
	  call Draw_Func(f3)
	end select
  end do
  ! 设定主程序代码结束后,窗口会自动关闭
  result=SetExitQQ(QWIN$EXITNOPERSIST)
end program Plot_Sine

subroutine Draw_Func(func)
use DFLIB
implicit none
  integer, parameter :: lines=500	! 用多少线段来画函数曲线
  real(kind=8), parameter :: X_Start=-5.0	! x轴最小范围
  real(kind=8), parameter :: X_End=5.0		! x轴最大范围	
  real(kind=8), parameter :: Y_Top=5.0		! y轴最大范围 
  real(kind=8), parameter :: Y_Bottom=-5.0	! y轴最小范围
  integer :: result			! 取回绘图函数运行状态
  integer(kind=2) :: color	! 设定颜色用
  real(kind=8) :: step		! 循环的增量
  real(kind=8) :: x,y		! 绘图时使用,每条小线段都连接
  real(kind=8) :: NewX,NewY	! (x,y)及(NewX,NewY)
  real(kind=8), external :: func ! 待绘图的函数
  type(wxycoord) :: wt		! 返回上一次的逻辑坐标位置
  type(xycoord)  :: t		! 返回上一次的实际坐标位置

  call ClearScreen($GCLEARSCREEN) ! 清除萤幕
  ! 设定逻辑坐标范围大小	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Bottom )
  ! 用索引值的方法来设定颜色
  result=SetColor(2)   ! 默认的2号是应该是绿色
  call MoveTo(10,20,t) ! 移动画笔到窗口的(10,20)
  
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
    y=func(x)		! 线段的左端点
	NewX=x+step		
	NewY=func(NewX)	! 线段的右端点
	call MoveTo_W(x,y,wt)
	result=LineTo_W(NewX,NewY)
  end do
  ! 设定程序结束后,窗口会继续保留
  result=SetExitQQ(QWIN$EXITPERSIST)
end subroutine Draw_Func
! 所要绘图的函数
real(kind=8) function f1(x)
implicit none
  real(kind=8) :: x
  f1=sin(x)
  return
end function f1
real(kind=8) function f2(x)
implicit none
  real(kind=8) :: x
  f2=cos(x)
  return
end function f2
real(kind=8) function f3(x)
implicit none
  real(kind=8) :: x
  f3=(x+2)*(x-2)
  return
end function f3