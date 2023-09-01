program main
  use sgl
  implicit none
  external display ! 声明display是个函数
  ! 设定当窗口需要重绘时,会调用子程序display
  call sglDisplaySub(display)  
  ! 打开窗口, 窗口左上角为(100,100), 长宽同为500
  call sglCreateWindow(100,100,500,500,0)
  write(*,*) "Waiting message."
  ! 等待使用者给程序的信息
  call sglMainLoop()
  write(*,*) "The End."
  stop
end
! 每当窗口需要更新画面时, 会调用display
subroutine display()
  use sgl
  implicit none
  call sglClearBuffer()          ! 消除屏幕
  call sglColor3f(1.0,0.0,0.0)   ! 设定目前要使用红色来绘图
  call sglDrawLine(0,0, 500,500) ! 在(0,0)到(500,500)两点之间画线
  return
end subroutine