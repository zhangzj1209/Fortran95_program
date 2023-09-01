program ex1002
  implicit none
  integer, pointer :: p   ! 声明一个可以指向整数的指针　
  allocate(p) ! 配置一块可以存放integer的内存空间给指针p
  p=100       ! 得到内存后指针p 可以像一般整数一样来使用
  write(*,*) p
  stop
end