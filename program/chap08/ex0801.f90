program  ex0801
implicit none
  call message() ! �����ӳ���message
  call message()
  stop
end 
! �ӳ���message
subroutine message()
implicit none
  write(*,*) "Hello."
  return
end