program ex0421
  integer   a
  real      b
  complex   c
  logical   d
  character(len=20) e
  a=10
  b=12.34
  c=(1,2)
  d=.true.
  e="FORTRAN"
  write(*,"(1X,I5)")    a  ! 用I来格式化整数
  write(*,"(1X,F5.2)" ) b  ! 用F来格式化浮点数
  write(*,"(1X,F4.1,F4.1)" ) c ! complex也是浮点数
  write(*,"(1X,L3)") d  ! 用L来输出logical
  write(*,"(1X,A10)") e ! 用A来输出字符串
end
