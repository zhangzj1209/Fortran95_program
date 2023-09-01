module sgl_util
  use sgl
  implicit none
contains
  subroutine Display()
    write(*,*) "Update"
    call sglClearBuffer() ! 清除画面
	call sglColor3f(1.0,0,0) ! 使用红色
	call sglRect(100,100,300,300) ! 以(100,100)和(300,300)为端画矩形
    call sglColor3i(0,255,0) ! 使用绿色
    call sglCircle(200,200,200) ! 以(200,200)为圆心, 画半径为200的圆
	call sglColor3i(0,0,255) ! 使用蓝色
	call sglLine(200,0, 200,400) ! 在(200,0)到(200,400)两点间画线
	call sglLine(0,200, 400,200) ! 在(0,200)到(400,200)两点间画线
  end subroutine
end module

program main
  use sgl_util
  implicit none
  call sglDisplaySub(Display) ! 设定窗口更新时调用Display
  ! 打开绘图窗口, 左上角为(100,100), 宽高同为400
  call sglCreateWindow(100,100,400,400,0)
  ! 进入等待信息的循环
  call sglMainLoop()
  stop
end program