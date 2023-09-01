program ex0432
implicit none
  integer :: a=1
  integer :: b=2
  real    :: c
  c=real(a)/real(b) ! 经由库函数real把整数转换成浮点数 
  write(*,"(F5.2)") c 
end
