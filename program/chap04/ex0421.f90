program ex0421
  integer   a
  real      b
  complex   c
  logical   d
  character(len=20) e
  a=10
  b=12.34
  c=(1,2)
  d=.true.
  e="FORTRAN"
  write(*,"(1X,I5)")    a  ! ��I����ʽ������
  write(*,"(1X,F5.2)" ) b  ! ��F����ʽ��������
  write(*,"(1X,F4.1,F4.1)" ) c ! complexҲ�Ǹ�����
  write(*,"(1X,L3)") d  ! ��L�����logical
  write(*,"(1X,A10)") e ! ��A������ַ���
end
