! 使用菜单范例
! By Perng 1997/9/22
program Menu_Demo
use DFLIB
implicit none
  type(windowconfig) :: wc
  integer :: result  
  integer :: i,ix,iy
  wc.numxpixels=200 ! 窗口的宽
  wc.numypixels=200 ! 窗口的高
  ! -1代表让程序自行去做决定
  wc.numtextcols=-1	! 每行容量的文字
  wc.numtextrows=-1	! 可以有几列文字
  wc.numcolors=-1	! 使用多少颜色
  wc.title="Plot Area"C ! 窗口的标题
  wc.fontsize=-1
  ! 根据wc中所定义的数据来重新设定窗口大小
  result=SetWindowConfig(wc)
  ! 把程序放入等待鼠标信息的状态
  do while (.TRUE.)
    i = waitonmouseevent(MOUSE$RBUTTONDOWN, i, ix, iy)
  end do
end program
!
! 程序会自动执行这个函数, 它会设定窗口的长相
!
logical(kind=4) function InitialSettings()
use DFLIB
implicit none
  logical(kind=4) :: result
  type(qwinfo) :: qw
  external PlotSin,PlotCos  
  
  ! 设定整个窗口程序一开始出现的位置及大小
  qw.type=QWIN$SET
  qw.x=0
  qw.y=0
  qw.h=400
  qw.w=400
  result=SetWSizeQQ(QWIN$FRAMEWINDOW,qw) 
  ! 组织第一组菜单
  result=AppendMenuQQ(1,$MENUENABLED,'&File'C,NUL)		 
  result=AppendMenuQQ(1,$MENUENABLED,'&Save'C,WINSAVE)   
  result=AppendMenuQQ(1,$MENUENABLED,'&Print'C,WINPRINT) 
  result=AppendMenuQQ(1,$MENUENABLED,'&Exit'C,WINEXIT)  
  ! 组织第二组菜单
  result=AppendMenuQQ(2,$MENUENABLED,'&Plot'C,NUL)
  result=AppendMenuQQ(2,$MENUENABLED,'&sin(x)'C,PlotSin)
  result=AppendMenuQQ(2,$MENUENABLED,'&cos(x)'C,PlotCos)
  ! 组织第三组菜单
  result=AppendMenuQQ(3,$MENUENABLED,'&Exit'C,WINEXIT)

  InitialSettings=.true.
  return
end function InitialSettings
!
! 画sin的子程序
!
subroutine PlotSin(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f1
  integer :: result
  ! 在第二组菜单的第一个选项,也就是sin的前面打个勾
  result=ModifyMenuFlagsQQ(2,1,$MENUCHECKED)
  ! 把选项cos前的勾取消
  result=ModifyMenuFlagsQQ(2,2,$MENUUNCHECKED)
  call Draw_Func(f1)
  return
end subroutine
!
! 画cos的子程序
!
subroutine PlotCos(check)
use DFLIB
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f2
  integer :: result
  check=.true.
  ! 把选项sin前的勾取消
  result=ModifyMenuFlagsQQ(2,1,$MENUUNCHECKED)
  ! 在选项cos前打个勾
  result=ModifyMenuFlagsQQ(2,2,$MENUCHECKED)
  call Draw_Func(f2)
  return
end subroutine
!
! 画出所传入的函数图形来
!
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

  call ClearScreen($GCLEARSCREEN) ! 清除屏幕
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
!
! 所要绘图的函数
!
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
