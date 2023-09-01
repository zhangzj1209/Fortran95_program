program ex0810
implicit none
  integer :: a,b
  common a,b ! 定义a,b是全局变量中的第1及第2个变量
  a=1
  b=2
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  integer :: num1, num2
  common num1, num2 ! 定义a,b是全局变量中的第1及第2个变量
  write(*,*) num1, num2
  return
end
