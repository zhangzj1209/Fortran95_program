program ex0817
implicit none
  integer, parameter :: size = 5
  integer :: s = size
  integer :: a(size) = (/ 1,2,3,4,5 /)
  call UseArray1(a,size) ! 把常数size传入做数组大小
  call UseArray1(a,s)    ! 把一般变数s 传入做数组大小
  call UseArray2(a)      ! 不传入数组大小
  call UseArray3(a)
  stop
end

subroutine UseArray1(num, size)
implicit none
  integer :: size 
  integer :: num(size) ! 传入的数组大小可用变量来指定
  write(*,*) num
  return
end

subroutine UseArray2(num)
implicit none
  integer :: num(*) ! 不指定数组大小
  integer :: i
  write(*,*) (num(i), i=1,5) 
  ! 如果传入的数组大小少于5, write在执行时会出现错误
  return
end

subroutine UseArray3(num)
implicit none
  integer :: num(-2:2) ! 可以重新定义数组坐标范围
  write(*,*) num(0)
  return
end
