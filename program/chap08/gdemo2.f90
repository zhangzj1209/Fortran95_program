program gdemo2
  use TextGraphLib
  implicit none
  
  call SetScreen( 20, 20 )
  call SetCurrentChar('o')       ! 改用o来作为填充字符
  call DrawCircle( 8, 4 , 3, 4)  ! 画圆
  call SetCurrentChar('#')       ! 改用#来作为填充字符
  call DrawFilledRect( 4, 8, 13, 18 )  ! 画矩形
  call UpdateScreen()            ! 显示绘图结果

  stop
end