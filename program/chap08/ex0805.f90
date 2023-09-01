program  ex0805
implicit none
  integer :: a = 1
  integer :: b = 2
  write(*,*) a,b
  call add(a)
  call add(b)
  write(*,*) a,b
  stop
end

subroutine add(num)
implicit none
  integer :: num
  num = num+1
  return
end
