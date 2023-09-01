!
! 使用菜单及对话窗的范例
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
! 程序会自动执行这个函数, 它会设定窗口的模样
!
logical(kind=4) function InitialSettings()
use DFLIB
implicit none
  logical(kind=4) :: result
  type(qwinfo) :: qw
  external PlotSin,PlotCos  
  external SetRange
  
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
  result=AppendMenuQQ(3,$MENUENABLED,'&Range'C,SetRange)

  InitialSettings=.true.
  return
end function InitialSettings
!
! 记录全局变量
!
module Global
implicit none
  real(kind=8) :: X_Start=-5.0  ! x轴最小范围
  real(kind=8) :: X_End=5.0		! x轴最大范围	
  real(kind=8) :: Y_Top=5.0		! y轴最大范围 
  real(kind=8) :: Y_Buttom=-5.0	! y轴最小范围
  integer      :: lines=500     ! 用多少线段来画函数曲线
  integer	   :: Function_Num=0 ! 使用第几号函数来画图
end module  
!
! 画sin的子程序
!
subroutine PlotSin(check)
use DFLIB
use Global
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f1
  integer :: result
  check=.true.
  Function_Num=1
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
use Global
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f2
  integer :: result
  check=.true.
  Function_Num=2
  ! 把选项sin前的勾取消
  result=ModifyMenuFlagsQQ(2,1,$MENUUNCHECKED)
  ! 在选项cos前打个勾
  result=ModifyMenuFlagsQQ(2,2,$MENUCHECKED)
  call Draw_Func(f2)
  return
end subroutine
!
! 按下Range时,会执行这个子程序
!
subroutine SetRange(check)
use Global
use Dialogm
implicit none
  logical(kind=4) :: check
  real(kind=8), external :: f1,f2
  external ReSetRange
  ! 因为想在对话窗中保留上一次的设定结果,所以安排了下列的变量
  real(kind=8),save :: OX_Start=-5.0  ! x轴最小范围
  real(kind=8),save :: OX_End=5.0	  ! x轴最大范围	
  real(kind=8),save :: OY_Top=5.0	  ! y轴最大范围 
  real(kind=8),save :: OY_Buttom=-5.0 ! y轴最小范围
  integer     ,save :: Olines=500     ! 用多少线段来画函数曲线
  include 'resource.fd'	! 对话窗的信息 
  type(dialog) :: dl	
  integer :: result		!
  character(len=20) :: str	

  check=.true.
  ! 声明要使用代码为IDD_INPUT的对话窗, 并把显示这个对话窗的信息放
  ! 在dl中. 以后只要对dl来处理就等于对这个对话窗来工作
  result=DlgInit(IDD_INPUT, dl)
    
  ! 下面要对dl所代表的对话窗中ID值为IDC_X_MIN来设定初值
  ! 也就是设定IDD_INPUT中X min栏的内容
  
  ! 因为DlgSet无法使用read类型变量来设定,所以要先把它们转换成字符串
  write(str,'(f6.2)') OX_Start
  result=DlgSet(dl,IDC_X_MIN,str)
  ! 设定X max栏的内容
  write(str,'(f6.2)') OX_End
  result=DlgSet(dl,IDC_X_MAX,str)
  ! 设定Y min栏的内容
  write(str,'(f6.2)') OY_Buttom
  result=DlgSet(dl,IDC_Y_MIN,str)
  ! 设定Y max栏的内容
  write(str,'(f6.2)') OY_Top
  result=DlgSet(dl,IDC_Y_MAX,str)
  ! 设定Lines栏的内容
  write(str,'(I5)') OLines
  result=DlgSet(dl,IDC_LINES,str)
  ! 设定按下Reset时会执行的子程序
  result=DlgSetSub(dl,IDC_RESET, ReSetRange)
  ! 到此才真正秀出对话窗
  result=DlgModal(dl)
  
  if ( result==IDOK ) then
  ! 由字符串转成数值
    result=DlgGet(dl,IDC_X_MIN,str)
    read(str,*) OX_Start
    result=DlgGet(dl,IDC_X_MAX,str)
	read(str,*) OX_End
    result=DlgGet(dl,IDC_Y_MIN,str)
	read(str,*) OY_Buttom
    result=DlgGet(dl,IDC_Y_MAX,str)
    read(str,*) OY_Top
    result=DlgGet(dl,IDC_LINES,str)
	read(str,*) OLines
  ! 设定全局变量的值, 绘图时会取用这些数值
    X_Start=OX_Start
	X_End=OX_End
	Y_Top=OY_Top
	Y_Buttom=OY_Buttom
	Lines=OLines
  end if
  ! 由Function_Num的值来决定要画出第几个函数
  select case(Function_Num)
  case(0)
    ! Do Nothing
  case(1)
    call Draw_Func(f1) 
  case(2)
    call Draw_Func(f2)
  end select

  return
end subroutine
!
! 按下Reset会执行这个子程序
! dlg,id,callback会自动传入
subroutine ReSetRange( dlg, id, callbacktype )
use DialogM
implicit none
  type(Dialog) :: dlg
  integer :: id,callbacktype
  integer :: t1,t2
  integer :: result
  include 'resource.fd'
  ! 下面这两行没什么用,只是如果没有下面两行,Compile时会有Warning.
  t1=id
  t2=callbacktype
  ! 重新设定对话窗中每个项的内容
  result=DlgSet(dlg,IDC_X_MIN,'-5.00')
  result=DlgSet(dlg,IDC_X_MAX,' 5.00')
  result=DlgSet(dlg,IDC_Y_MIN,'-5.00')
  result=DlgSet(dlg,IDC_Y_MAX,' 5.00')
  result=DlgSet(dlg,IDC_LINES,'500')

  return
end subroutine  
!
! 画出所传入的函数图形来
!
subroutine Draw_Func(func)
use DFLIB
use Global
implicit none
  integer :: result			! 取回绘图函数运行状态
  integer(kind=2) :: color	! 设定颜色用
  real(kind=8) :: step		! 循环的增量
  real(kind=8) :: x,y		! 绘图时使用,每条小线段都连接
  real(kind=8) :: NewX,NewY	! (x,y)及(NewX,NewY)
  real(kind=8), external :: func ! 待绘图的函数
  type(wxycoord) :: wt		! 传回上一次的逻辑坐标位置

  call ClearScreen($GCLEARSCREEN) ! 清除屏幕
  ! 设定逻辑坐标范围大小	
  result=SetWindow( .true. , X_Start, Y_Top, X_End, Y_Buttom )

  ! 使用全彩RGB 0-255的256种色阶来设定颜色
  color=RGBToInteger(255,0,0)		! 把控制RGB的三个值转换到color中
  result=SetColorRGB(color)			! 利用color来设定颜色

  call MoveTo_W(X_Start,0.0_8,wt)	! 画X轴
  result=LineTo_W(X_End,0.0_8)		! 
  call MoveTo_W(0.0_8,Y_Top,wt)		! 画Y轴
  result=LineTo_W(0.0_8,Y_Buttom)	! 	

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
