program ex0436
implicit none
real(kind=4) :: a
real(kind=8) :: b
a=1.0_4 ! ȷ��1.0���������ʹ�õ�����
b=1.0_8 ! ȷ��1.0���������ʹ��˫����
write(*,*) a,b
stop
end