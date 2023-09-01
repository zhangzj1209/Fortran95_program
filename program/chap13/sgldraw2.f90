module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    call sglClearBuffer() ! 清除画面
	call sglColor3f(1.0,0,0) ! 使用红色
	call sglRectV(0.2, 0.2, 0.8, 0.8) ! 以(0.2,0.2)和(0.8,0.8)为端画矩形
    call sglColor3i(0,255,0) ! 使用绿色
    call sglCircleV(0.5,0.5,0.5) ! 以(0.5,0.5)为圆心, 画半径为0.5的圆
	call sglColor3i(0,0,255) ! 使用蓝色
	call sglLineV(0.5,0, 0.5, 1.0) ! 在(250,0)到(250,500)两点间画线
	call sglLineV(0.0,0.5, 1.0,0.5) ! 在(0,250)到(500,250)两点间画线
	call sglUpdateBuffer();
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display)
  ! 设定窗口左上角的虚拟座标为(0,0)右下角为(1.0,1.0)
  call sglSetVirtual(0.0, 0.0, 1.0, 1.0)
  call sglCreateWindow(100,100,500,500,1)
  call sglMainLoop()
  stop
end program