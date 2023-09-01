program ex0431
implicit none
  integer :: a=1
  integer :: b=2
  real    :: c
  c=a/b 
! c=1/2=0, 虽然c是浮点数,但因为a,b是整数,计算a/b时会用整数去计算.
  write(*,"(F5.2)") c 
end
