program main
  use GAME
  implicit none

  call sglDisplaySub(display)
  call sglMouseMoveSub(MouseMove)
  call sglEnableReshape(0)
  call sglCreateWindow(50,50,SX,SY,1)
  call InitGame()
  call sglIdleSub(OnIdle)
  call sglMainLoop()
  
  stop
end program