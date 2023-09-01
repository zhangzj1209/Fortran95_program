program ex0715
implicit none
  integer, parameter :: max = 1000
  integer :: a(max) ! 先声明一个超大的数组
  integer :: students
  integer :: i
    
  write(*,*) "How many students:"
  read(*,*) students

  ! 输入成绩
  do i=1,students
    write(*,"('Number ',I3)") i
    read(*,*) a(i)
  end do

  stop
end
