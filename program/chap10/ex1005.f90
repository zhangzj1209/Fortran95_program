program ex1005
  implicit none
  integer, pointer :: a(:) ! 定义a是一维的指针数组
  allocate( a(5) )  ! 配置5个整数的空间给指针a
  a = (/ 1,2,3,4,5 /)
  write(*,*) a
  deallocate( a )   ! allocate得到的内存要记得归还
  stop
end
