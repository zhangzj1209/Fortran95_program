program ex0810
implicit none
  integer :: a,b
  common a,b ! ����a,b��ȫ�ֱ����еĵ�1����2������
  a=1
  b=2
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  integer :: num1, num2
  common num1, num2 ! ����a,b��ȫ�ֱ����еĵ�1����2������
  write(*,*) num1, num2
  return
end
