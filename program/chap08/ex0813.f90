program ex0813
implicit none
  real a
  common a ! 把浮点数a放在全局变量中
  a = 1.0
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  integer a
  common a ! 把整数a放在全局变量中
  write(*,*) a
  return
end