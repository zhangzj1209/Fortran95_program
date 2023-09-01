program ex0436
implicit none
real(kind=4) :: a
real(kind=8) :: b
a=1.0_4 ! 确定1.0这个数字是使用单精度
b=1.0_8 ! 确定1.0这个数字是使用双精度
write(*,*) a,b
stop
end