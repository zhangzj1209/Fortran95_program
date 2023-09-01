program  ex0801
implicit none
  call message() ! 调用子程序message
  call message()
  stop
end 
! 子程序message
subroutine message()
implicit none
  write(*,*) "Hello."
  return
end