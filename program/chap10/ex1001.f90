program ex1001
  implicit none
  integer, target  :: a=1 ! ����һ�����Ե���Ŀ��ı���
  integer, pointer :: p   ! ����һ������ָ��������ָ�롡
  p=>a ! ��ָ��pָ������a
  write(*,*) p
  a=2  ! �ı�a��ֵ
  write(*,*) p
  p=3  ! �ı�ָ��pָ����ڴ�����
  write(*,*) a
  stop
end