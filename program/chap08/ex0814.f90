program ex0814
implicit none
  real a,b
  common a,b ! �Ѹ�����a,b����ȫ�ֱ�����
  a = 1.0
  b = 2.0
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  real a(2)
  common a ! ������a����ȫ�ֱ�����
  write(*,*) a(1), a(2)
  return
end