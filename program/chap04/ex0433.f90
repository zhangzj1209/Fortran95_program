program ex0433
implicit none
  integer :: a=1
  real    :: b=2
  real    :: c
  c=a ! 整数赋值给浮点数的操作会自动转换
  write(*,"(F5.2)") c
  c=a/b ! 因为除数跟被除数类型不同, 计算的结果会以浮点数来表示.
  write(*,"(F5.2)") c 
end
