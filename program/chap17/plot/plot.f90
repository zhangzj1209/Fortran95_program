! 简单的绘图范例
! By Perng 1997/9/19
program Plot_Demo
! 使用Visual Fortran的绘图功能时需要module dflib
use DFLIB	
implicit none
  type(xycoord) :: t
  integer :: result
  call MoveTo(10,10,t)  ! 把目前绘图的位置移动到坐标(10,10)
  result=LineTo(100,50) ! 从(10,10)到(100,50)间绘一条直线
  ! 绘一个左上角为(110,10), 右下角为(150,50)的实心方形
  result=Rectangle( $GFILLINTERIOR, 110,10, 150, 50 )
  ! 绘一个可以放入在(10,60)--(150,100)方形当中的空心椭圆
  result=Ellipse($GBORDER, 10, 60, 150, 100)
end program Plot_Demo
