program ex0814
implicit none
  real a,b
  common a,b ! 把浮点数a,b放在全局变量中
  a = 1.0
  b = 2.0
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  real a(2)
  common a ! 把数组a放在全局变量中
  write(*,*) a(1), a(2)
  return
end