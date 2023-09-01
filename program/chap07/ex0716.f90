program ex0716
implicit none
  integer :: students
  integer, allocatable :: a(:) ! 声明一个可变大小的一维数组
  integer :: i
    
  write(*,*) "How many students:"
  read(*,*) students
  allocate( a(students) ) ! 配置内存空间

  ! 输入成绩
  do i=1,students
    write(*,"('Number ',I3)") i
    read(*,*) a(i)
  end do

  stop
end
