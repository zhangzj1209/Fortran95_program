program ex0816
implicit none
  integer :: a(5) = (/ 1,2,3,4,5 /)
  call ShowOne(a)   ! 传入a, 也就是传入数组a第1个元素的内存地址
  call ShowArray5(a)  
  call ShowArray3(a)  
  call ShowArray3( a(2) ) ! 传入a(2), 也就是传入数组a第2个元素的内存地址
  call ShowArray2X2(a)  
  stop
end

subroutine ShowOne(num)
implicit none
  integer :: num ! 只取出参数地址中的第1个数字
  write(*,*) num
  return
end

subroutine ShowArray5(num)
implicit none
  integer :: num(5) ! 取出参数地址中的前5个数字,当成数组来使用
  write(*,*) num
  return
end

subroutine ShowArray3(num)
implicit none
  integer :: num(3) ! 取出参数地址中的前3个数字,当成数组来使用
  write(*,*) num
  return
end

subroutine ShowArray2X2(num)
implicit none
  integer :: num(2,2) ! 取出参数地址中的前4个数字,当成2X2数组来使用
  write(*,*) num(2,1), num(2,2)
  return
end