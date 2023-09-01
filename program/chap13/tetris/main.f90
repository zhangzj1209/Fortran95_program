program main
  use GAME
  implicit none
  
  call sglDisplaySub(display)
  call sglKeyDownSub(keydown)
  call sglIdleSub(OnIdle)
  call Init()
  call sglCreateWindow(50,50,SX,SY,1)
  call sglMainLoop()

  stop
end program
