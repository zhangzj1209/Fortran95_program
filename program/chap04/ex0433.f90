program ex0433
implicit none
  integer :: a=1
  real    :: b=2
  real    :: c
  c=a ! ������ֵ���������Ĳ������Զ�ת��
  write(*,"(F5.2)") c
  c=a/b ! ��Ϊ���������������Ͳ�ͬ, ����Ľ�����Ը���������ʾ.
  write(*,"(F5.2)") c 
end
