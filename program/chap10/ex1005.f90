program ex1005
  implicit none
  integer, pointer :: a(:) ! ����a��һά��ָ������
  allocate( a(5) )  ! ����5�������Ŀռ��ָ��a
  a = (/ 1,2,3,4,5 /)
  write(*,*) a
  deallocate( a )   ! allocate�õ����ڴ�Ҫ�ǵù黹
  stop
end
