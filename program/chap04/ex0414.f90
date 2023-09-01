program ex0414
  character(len= 6) first
  character(len=10) second
  character(len=20) add
  first="Happy "
  second="Birthday"
  add = first//second ! 经由两个连续的除号可以连接两个字符串
  write(*,*) add
end
