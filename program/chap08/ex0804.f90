program  ex0804
implicit none
  integer :: a = 1
  integer :: b = 2
  call add(a,b)  ! 把变量a及b交给子程序add来处理
  stop
end

subroutine add(first, second)
implicit none
  integer :: first, second ! first,second的内容会从CALL时得到
  write(*,*) first+second
  return
end

