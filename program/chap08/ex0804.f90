program  ex0804
implicit none
  integer :: a = 1
  integer :: b = 2
  call add(a,b)  ! �ѱ���a��b�����ӳ���add������
  stop
end

subroutine add(first, second)
implicit none
  integer :: first, second ! first,second�����ݻ��CALLʱ�õ�
  write(*,*) first+second
  return
end

