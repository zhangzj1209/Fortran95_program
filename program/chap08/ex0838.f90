program ex0838
  implicit none

  call sub()
  call mid()

  stop
end 

subroutine sub()
  implicit none

  write(*,*) "Hello."
  entry mid()
  write(*,*) "Good morning."

  return
end