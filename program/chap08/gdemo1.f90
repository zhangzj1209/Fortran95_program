program gdemo1
  use TextGraphLib
  implicit none
  
  call SetScreen( 10, 10 )      ! 设定分辨率为10x10
  call DrawLine( 1, 1, 10, 10 ) ! 在(1,1)到(10,10)这两点间画一条线
  call UpdateScreen()           ! 显示绘图的结果

  stop
end