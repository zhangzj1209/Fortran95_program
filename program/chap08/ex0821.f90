program ex0821
  implicit none声明func是个自定义函数
  real, intrinsic :: sin  ! 声明sin是库函数

  call ExecFunc(func)
  call ExecFunc(sin)

  stop
end program

subroutine ExecFunc(f)
  implicit none
  real, external :: f ! 声明参数f是个函数
  write(*,*) f(1.0)   ! 执行传入的函数f
  return
end 

real function func(num)
  implicit none
  real :: num
  func = num*2
  return
end function