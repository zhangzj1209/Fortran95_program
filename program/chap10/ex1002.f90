program ex1002
  implicit none
  integer, pointer :: p   ! ����һ������ָ��������ָ�롡
  allocate(p) ! ����һ����Դ��integer���ڴ�ռ��ָ��p
  p=100       ! �õ��ڴ��ָ��p ������һ������һ����ʹ��
  write(*,*) p
  stop
end