program ex0813
implicit none
  real a
  common a ! �Ѹ�����a����ȫ�ֱ�����
  a = 1.0
  call ShowCommon()
  stop
end

subroutine ShowCommon()
implicit none
  integer a
  common a ! ������a����ȫ�ֱ�����
  write(*,*) a
  return
end