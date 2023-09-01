! 处理鼠标事件的函数
module MouseEvent
use DFLIB
implicit none
Contains
  ! 鼠标在窗口中每移动一次,就会调用这个函数
  subroutine ShowLocation(iunit, ievent, ikeystate, ixpos, iypos)
  implicit none
    integer :: iunit		! 鼠标所在的窗口的unit值
	integer :: ievent		! 鼠标发生的信息码
	integer :: ikeystate	! 进入这个函数时,其它控制键的状态
	integer :: ixpos,iypos	! 鼠标在窗口中的位置
    type(xycoord) :: t		 
	integer :: result		 
	character(len=15) :: output	! 设定输出的字串

	result=SetActiveQQ(iunit)		! 把绘图工作指向这个窗口
    write(output,100) ixpos,iypos	! 把鼠标所在位置的信息写入output
100 format("(X:",I4," Y:",I4,")")	!
    result=SetColorRGB(#1010FF)		 
    result=Rectangle($GFILLINTERIOR,0,0,120,18) ! 画一个实心方形
    result=SetColorRGB(#FFFFFF) 
	call MoveTo( 4,2,t)	
	call OutGText(output)	! 显示信息
	! 如果鼠标在移动当中, 左键同时被按下, 会顺便画出一个点.
	if ( ikeystate==MOUSE$KS_LBUTTON ) then
	  result=SetColorRGB(#0000FF)
	  result=SetPixel(ixpos,iypos)
	end if
	return
  end subroutine
  ! 鼠标右键按下时, 会执行这个函数
  subroutine MouseClearScreen(iunit, ievent, ikeystate, ixpos, iypos )
  implicit none
    integer :: iunit		! 鼠标所在的窗口的unit值
	integer :: ievent		! 鼠标发生的信息码
	integer :: ikeystate	! 进入这个函数时,其它控制键的状态
	integer :: ixpos,iypos	! 鼠标在窗口中的位置
    type(xycoord) :: t		 
	integer :: result		 

	result=SetActiveQQ(iunit)		! 把绘图动作设定在鼠标所在窗口上
    call ClearScreen($GCLEARSCREEN)	! 清除整个屏幕
    
	return
  end subroutine    
end module

program Mouse_Demo
use DFLIB
use MouseEvent
implicit none
  integer :: result
  integer :: event
  integer :: state,x,y

  result=AboutBoxQQ("Mouse Draw Demo\r By Perng 1997/09"C)
  ! 打开窗口
  open( unit=10, file='user', title='Mouse Demo', iofocus=.true. )
  ! 使用字形前, 一定要调用InitializeFonts
  result=InitializeFonts()
  ! 选用Courier New的字形在窗口中来输出			
  result=setfont('t''Courier New''h14w8')
  call ClearScreen($GCLEARSCREEN)	! 先清除一下屏幕
  ! 设定鼠标移动或按下左键时, 会调用ShowLocation
  event=ior(MOUSE$MOVE,MOUSE$LBUTTONDOWN)
  result=RegisterMouseEvent(10, event, ShowLocation)
  ! 设定鼠标右键按下时, 会调用MouseClearScreen
  event=MOUSE$RBUTTONDOWN
  result=RegisterMouseEvent(10, event, MouseClearScreen )
  ! 把程序放入等待鼠标输入的状态
  do while(.true.)
    result=WaitOnMouseEvent( MOUSE$MOVE .or. MOUSE$LBUTTONDOWN .or.&
  	MOUSE$RBUTTONDOWN, state, x, y )
  end do
end program
