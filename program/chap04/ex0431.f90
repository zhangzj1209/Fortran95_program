program ex0431
implicit none
  integer :: a=1
  integer :: b=2
  real    :: c
  c=a/b 
! c=1/2=0, ��Ȼc�Ǹ�����,����Ϊa,b������,����a/bʱ��������ȥ����.
  write(*,"(F5.2)") c 
end
