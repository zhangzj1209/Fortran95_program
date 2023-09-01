program ex0820
implicit none
  call sub()
  call sub()
  call sub()
  stop
end program

subroutine sub()
  implicit none
  integer :: count = 1
  save    count      ! 指定count变量会永远活着, 不会忘记它的内容
  write(*,*) count
  count = count+1
  return
end